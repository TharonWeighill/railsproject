class RecipesController < ApplicationController
    before_action :find_recipe, only: :index

    #route to all recipes
    def index
        @recipes = Recipe.all
    end
    
    private 
    
    def find_recipe
        @recipes = Recipe.all
    end 
    
    def find_category
        find_recipe
        @category = @recipes.catagory
    end
    
end 