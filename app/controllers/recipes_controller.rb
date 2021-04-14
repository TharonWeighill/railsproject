class RecipesController < ApplicationController
   
    before_action :find_recipe, only: [:edit, :show, :update, :destroy]

    def index
        @recipe = Recipe.all
    end

    def show
        @comments = Comment.all
    end 

    def new
        @recipe = Recipe.new
    end

    def create
        # redirect_if_not_logged_in
        @recipe = Recipe.new(recipe_params(:name, :category, :directions))
        if @recipe.save
            # # params["ingredients"].each do |hash|
            # if hash["name"] != ""
            #     ingredient= Ingredient.find_or_create_by(ingredient: hash["ingredient"].capitalize)
            #     IngredientRecipe.create(ingredient: ingredient, recipe: recipe, value: hash["value"])
            # end
            redirect_to @recipe
    
        else 
            flash[:error] = @recipe.errors.full_messages.to_sentence
            redirect_to 'new_recipes'
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
        @category = @recipes.catagory
    end

    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

    
end 