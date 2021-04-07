class BartendersController < ActionController
 
    #route to all users 
    def index
        @bartenders = Bartender.all
    end

    #show route for a single user
    def show
        @user = User.find_by(id: params[:id])
        @recipes = @user.recipes
    end
  
    #route to create user / has a form to create new user
    def new
    end
  
    #post create user
    def new
        user = User.create(params["user"])
        if user.valid?
            flash[:success] = "User Created!"
            session["user_id"] = user.id
            redirect "/users/#{user.id}"
        else 
            flash[:error] = user.errors.full_messages.to_sentence 
            redirect '/signup'
        end
    end 
    
  #renders form to edit user
    def edit
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        erb :edit
    end 
  
  #update user
  def update
    user = current_user
    user.update(params["user"])
    redirect "/users/#{user.id}"
  end 
    
  #delete existing user
    def delete 
        user = User.find_by(id: params[:id])
        user.destroy
        session.clear
        redirect "/"
    end
end 