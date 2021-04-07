class RecipesController < ApplicationController
    before_action :find_recipe, only: :index

    #route to all recipes
    def index
        find_recipe 
    end

    private 
    
    def find_recipe
        @recipes = Recipe.all
    end 


end 