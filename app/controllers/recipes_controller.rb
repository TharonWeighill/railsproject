class RecipesController < ApplicationController
   
    before_action :find_recipe, only: [:edit, :show, :update, :destroy]
    before_action :find_ingredient, only: [:show, :edit]
    before_action :find_comment, only: :show

    def index
        @recipe = Recipe.all
    end

    def show
    end 

    def new
        @recipe = Recipe.new
        @ingredient = Ingredient.new
        @value = IngredientRecipe.new
    end

    def create
        # redirect_if_not_logged_in
        # recipe = current_user.recipes.build(params["recipe"])
        # if recipe.save
        #   params["ingredients"].each do |hash|
        #   if hash["name"] != ""
        #     ingredient= Ingredient.find_or_create_by(ingredient: hash["ingredient"].capitalize)
        #     IngredientRecipe.create(ingredient: ingredient, recipe: recipe, value: hash["value"])
        #   end
        # end
        # redirect 'recipes'
        # else 
        #   flash[:error] = recipe.errors.full_messages.to_sentence
        #   redirect 'new_recipe'
        # end 
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

    def find_ingredient
        find_recipe
        @ingredients = @recipe.ingredients
    end

    def find_comment
        find_recipe
        @comments = @recipe.comments
    end 
    
    def find_category
        find_recipe
        @category = @recipes.catagory
    end

    def recipe_params
        params.require(:recipe).permit(:name, :category, :directions)
    end

    
end 