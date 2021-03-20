class CreateDiningPrep < ActiveRecord::Migration[6.1]
  def change
    create_table :dining_preps do |t|
      t.text :d_prep
      t.text :d_prep_note
      t.timestamps
    end
  end
end
