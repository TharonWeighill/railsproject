class CreateDiningNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :dining_notes do |t|
      t.text :d_note
      t.timestamps
    end
  end
end
