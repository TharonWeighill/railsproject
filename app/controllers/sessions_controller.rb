class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @bartender = Bartender.new
  end

  def create
    @bartender = Bartender.find_by(username: params[:username])
    if !!@bartender && @bartender.authenticate(params[:password])
      session[:bartender_id] = @bartender.id
      redirect_to bartender_path(@bartender)
    else
      redirect_to '/recipes'
    end
  end 

  def omniauth
    # use byebug to inspect what the auth method returns
    @bartender = Bartender.from_omniauth(auth)
    if @bartender.valid?
      session[:bartender_id] = @bartender.id
      redirect_to @bartender
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end