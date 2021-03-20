class CreateDiningPrep < ActiveRecord::Migration[6.1]
  def change
    create_table :dining_preps do |t|
      t.text :d_prep
      t.timestamps
    end
  end
end
