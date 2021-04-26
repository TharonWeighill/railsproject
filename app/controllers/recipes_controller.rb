class RecipesController < ApplicationController
   
    before_action :find_recipe, only: [:edit, :show, :update, :destroy]

    def index
        if params[:bartender_id] && @bartender = Bartender.find_by(id: params[:bartender_id])
            @recipes = @bartender.recipes 
        
        elsif params[:search]
            @recipes = Recipe.filter_by_category_name(params[:search])           
            
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
        4.times {@recipe.ingredient_recipes.build}
    end

    def create
        redirect_if_not_logged_in
        @recipe = Recipe.new(recipe_params(:name, :category, :directions, ingredient_recipes_attributes: [:unit, :value, :ingredient_id]))
        @recipe.bartender = current_user 
        if @recipe.save
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