class BartendersController < ActionController::Base
    before_action :find_bartender, only: [:show, :edit, :update, :destroy]
        
    def new
        @bartender = Bartender.new       
    end 
        
    def create
        @bartender = Bartender.new(user_params)
        if @bartender.valid?
            @bartender.save
            redirect_to bartender_path(@bartender)
        else
            flash[:error] = @bartender.errors.full_messages.to_sentence 
            render :new
        end
    end 
        
        
    def show
    end 
   
    def edit

    end

    def update

        if @bartender.update(user_params)
            redirect_to bartender_path(@bartender)
        else
            render :edit
        end 
    end 

    def destroy
        if @bartender.destroy
            redirect_to '/'
        else
            redirect_to back
        end 
    end 


    private 
    
    def find_bartender
        @bartender = Bartender.find(params[:id])
    end
    def user_params
        params.require(:bartender).permit(:username, :email, :password, :about)
    end

end 