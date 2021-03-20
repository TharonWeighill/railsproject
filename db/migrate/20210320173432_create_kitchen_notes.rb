class CreateKitchenNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchen_notes do |t|
      t.text :k_note
      t.timestamps
    end
  end
end
