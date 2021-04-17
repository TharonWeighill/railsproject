class IngredientRecipe < ApplicationRecord
    belongs_to :recipe, class_name: "Recipe"
    belongs_to :ingredient, class_name: "Recipe"
end