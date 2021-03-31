class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients do |t|    
      t.references :recipe
      t.references :ingredient
      t.string :value

      t.timestamps
    end 
  end
end
