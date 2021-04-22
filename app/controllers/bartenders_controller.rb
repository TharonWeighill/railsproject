class BartendersController < ActionController::Base
    include ApplicationHelper
    before_action :find_bartender
        
    def new
        @bartender = Bartender.new       
    end 
        
    def create
        @bartender = Bartender.new(user_params)
        if @bartender.valid?
            @bartender.save
            session[:bartender_id] = @bartender.id
            redirect_to bartender_path(@bartender)
        else
            flash[:error] = @bartender.errors.full_messages.to_sentence 
            render :new
        end
    end 
        
        
    def show
    end 
   
    def edit
        redirect_if_not_logged_in
    end

    def update
        @bartender.update(user_params(:username, :about, :email, :password))
        if @bartender.valid?
            redirect_to bartender_path(@bartender)
        else
            render :edit
        end 
    end 

    def destroy
        @bartender.destroy

        redirect_to '/'
    end 


    private 
    
    def find_bartender
        @bartender = Bartender.find(params[:id])
    end
    def user_params(*args)
        params.require(:bartender).permit(*args)
    end


end 