class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def error
    end 

    def terms
    end 

    private


    def logged_in?
        !current_user.nil?
    end 

    def current_user
        User.find_by(id: sessions[:bartender_id])
    end 
end
