class AddUnitToIngredientRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredient_recipes, :unit, :string
  end
end
