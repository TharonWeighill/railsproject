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
      flash.now[:notice] = "Invalid credentails"
     render :home
    end 
  end 

  

  def omniauth
    bartender = Bartender.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |b|
      b.username = auth['info']['name'].downcase.gsub(" ", "_")
      b.email = auth['info']['email'] 
      b.password = SecureRandom.hex(5)
    end 
    if bartender.valid?
      session[:bartender_id] = bartender.id
      redirect_to bartender
    else
      flash[:message] = bartender.errors.full_messages.join(", ")
      redirect_to '/'
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