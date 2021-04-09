class BartendersController < ActionController::Base
        before_action :find_bartender, only: [:show, :edit]
        
        
    def show
        @recipes = @user.recipes
    end 
    
    def new
        @bartender = Bartender.new       
    end 

    def create
        bartender = Bartender.create(params[:bartender])
        if bartender.valid?
          flash[:success] = "Bartender Created!"
          session["bartender_id"] = bartender.id
          redirect 'bartender' 
        else 
          flash[:error] = bartender.errors.full_messages.to_sentence 
          redirect 'new_bartender'
    end 
    
    def edit
        redirect_if_not_logged_in
    end


    private 

    def find_bartender
        @bartender = Bartender.find_by(id: params[:id])
    end
    
end 