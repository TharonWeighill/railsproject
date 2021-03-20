class CreateKitchenPrep < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchen_preps do |t|
      t.text :k_prep
      t.timestamps
    end
  end
end
