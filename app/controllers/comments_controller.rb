class CommentsController <  ApplicationController

    def create
        @comment = Comment.new(comment_params(:textbody, :recipe_id))
        @comment.bartender = current_user
        if @comment.save
            flash[:success] = "Created Comment"
        else
            flash[:error] = @comment.errors.full_messages.to_sentence
        end 
        redirect_to recipe_path(@comment.recipe)

    end 

    def update
    end 


    private
    
    def comment_params(*args)
        params.require(:comment).permit(*args)
    end
    
end 