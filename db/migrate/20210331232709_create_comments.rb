class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text  :textbody
      t.references :recipe, foreign_key: {on_delete: :cascade}
      t.references :bartender, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
