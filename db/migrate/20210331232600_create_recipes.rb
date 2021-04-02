class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.string :category
      t.references :category,  foreign_key: {on_delete: :cascade}
      t.references :bartender, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
