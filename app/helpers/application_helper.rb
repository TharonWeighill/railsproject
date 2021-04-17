module ApplicationHelper
     
    def logged_in?
        !!current_user
    end 

    def current_user
        @current_user ||= Bartender.find_by(id: session[:bartender_id])
    end 

    def redirect_if_not_logged_in
        if !logged_in?
          redirect "/"
        end
    end

    def recipe_owner?(recipe)
        if current_user != recipe.user
            flash[:error] = "Sorry, that recipe doesn't belong to you!" 
        end 
    end

    def comment_owner?(comment)
        if current_user != comment.user
            flash[:error] = "Sorry, you can only edit your comments!"
        end
    end 
    
    def unit_list
        [
            "Oz", "Cup", "TSP", "Dash", "Pinch"
        ]
    end 
end
