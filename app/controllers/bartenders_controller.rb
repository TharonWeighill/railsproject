class BartendersController < ActionController::Base
    
    def show
    end 
    
    def new
        @bartender = Bartender.create(params["bartender"])
        # session[:bartender_id] = @bartender.id
        # redirect_to '/welcome'
    end 
    
    def edit
    end

end 