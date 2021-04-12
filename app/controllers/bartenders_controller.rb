class BartendersController < ActionController::Base
    before_action :find_bartender, only: [:show, :edit, :destroy]
        
    def new
        @bartender = Bartender.new       
    end 
        
    def create
        @bartender = Bartender.new(user_params)
        if @bartender.valid?
            @bartender.save
            redirect_to bartender_path(@bartender)
        else
            flash[:error] = bartender.errors.full_messages.to_sentence 
            render :new
        end
    end 
        
        
    def show
    end 
   
    def edit
        redirect_if_not_logged_in
    end

    def update
        user = current_user
        user.update(params["user"])
        redirect 'user'
    end 

    def destroy
        user.destroy
        session.clear
        redirect 'home'
    end 


    private 
    
    def find_bartender
        @bartender = Bartender.find(params[:id])
    end
    def user_params
        params.require(:bartender).permit(:username, :email, :password, :about)
    end

end 