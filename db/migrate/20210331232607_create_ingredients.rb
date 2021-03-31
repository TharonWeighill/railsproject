class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.text :ingredient
      t.text :value
      t.timestamps
    end
  end
end
