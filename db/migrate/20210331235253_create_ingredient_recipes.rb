class CreateIngredientRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_recipes do |t|
      t.references :recipe
      t.references :ingredient
      t.string :value

      t.timestamps
    end
  end
end
