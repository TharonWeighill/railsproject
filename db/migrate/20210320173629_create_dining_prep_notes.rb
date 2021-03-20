class CreateDiningPrepNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :dining_prep_notes do |t|
      t.text :d_prep_note    
      t.timestamps
    end
  end
end
