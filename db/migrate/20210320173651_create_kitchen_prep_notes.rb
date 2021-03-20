class CreateKitchenPrepNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchen_prep_notes do |t|
      t.text :k_prep_note
      t.timestamps
    end
  end
end
