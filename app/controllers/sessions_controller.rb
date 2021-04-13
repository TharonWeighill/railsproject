class SessionsController < ApplicationController
  

  def create
    @bartender = Bartender.find_by(username: params[:username])
    if !!@bartender && @bartender.authenticate(params[:password])
      sessions[:bartender_id] = @bartender.id
      redirect_to bartender_path
    else
      redirect_to '/'
    end
  end 
end
 