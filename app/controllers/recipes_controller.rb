class RecipesController < ApplicationController
   
    before_action 
        :find_recipe, only: [:index, :show], 
        :find_ingredient, only: [:show], 
        :find_comment, only: [:show]

    def index
        @recipes = Recipe.all
    end

    def show
    end 

    def new
    end

    def create
        redirect_if_not_logged_in
    end 

    def edit
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