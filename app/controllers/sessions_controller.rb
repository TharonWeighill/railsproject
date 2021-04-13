class SessionsController < ApplicationController
  

  def create
    @bartender = Bartender.find_by(username: params[:username])
    if !!@bartender && @bartender.authenticate(params[:password])
      session[:bartender_id] = @bartender.id
      redirect_to bartender_path(@bartender)
    else
      redirect_to '/recipes'
    end
  end 
end
 