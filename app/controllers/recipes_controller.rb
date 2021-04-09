class RecipesController < ApplicationController
   
    before_action 
        :find_recipe, only: [:index, :edit, :show], 
        :find_ingredient, only: [:show, :edit], 
        :find_comment, only: [:show]

    def index
        @recipes = Recipe.all
    end

    def show
    end 

    def new
        @recipe = Recipe.new
    end

    def create
        redirect_if_not_logged_in
        recipe = current_user.recipes.build(params["recipe"])
        if recipe.save
          params["ingredients"].each do |hash|
          if hash["name"] != ""
            ingredient= Ingredient.find_or_create_by(ingredient: hash["ingredient"].capitalize)
            IngredientRecipe.create(ingredient: ingredient, recipe: recipe, value: hash["value"])
          end
        end
        redirect "recipe"
        else 
          flash[:error] = recipe.errors.full_messages.to_sentence
          redirect "new_recipe"
        end 
    end 

    def edit
    end 

    def update
        redirect_if_not_logged_in
        if @recipe.user != current_user 
            redirect 'recipes' 
        end 

    end 
    
    
    def destroy
    end

    
   
   
private
    
    def find_recipe
        @recipes = Recipe.all
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
    
end 