class RecipesController < ApplicationController
   
    before_action :find_recipe, only: [:edit, :show, :update, :destroy]

    def index
        if params[:bartender_id] && @bartender = Bartender.find_by(id: params[:bartender_id])
            @recipes = @bartender.recipes 

        else     
            @recipes = Recipe.all
        end
    end

    def show
        @comments = Comment.all
        @comment = Comment.new
    end 

    def new
        @recipe = Recipe.new
        2.times {@recipe.ingredient_recipes.build}
    end

    def create
        redirect_if_not_logged_in
        @recipe = Recipe.new(recipe_params(:name, :category, :directions, ingredient_recipes_attributes: [:unit, :value, :ingredient_id]))
        @recipe.bartender = current_user
 
        if @recipe.save
            #find all ingredients that match all ids in form @recpie.ingredient_ids=[params recipe ingredients_id] 
            #IngredientRecipe.create(ingreditent_id: 4, recipe: @recipe, value: "#{pamars[:recipe][:quantity]} #{params[:recpipe][:unit}")
            redirect_to @recipe
        else 
            flash.now[:error] = @recipe.errors.full_messages.to_sentence
            render 'new'
        end 
    end 

    def edit
    end 

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end 
    end 
    
    
    
    def destroy
        if @recipe.destroy
            redirect_to 'recipes'
        else
            redirect_to back
        end 
    end 

    
   
   
    private
    
    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end 
    
    def find_category
        find_recipe
        @category = @recipe.catagory
    end

    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

    
end 