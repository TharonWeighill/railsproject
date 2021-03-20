class CreateRestaurant < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :r_name
      t.string :r_username
      t.string :password_digest
      t.timestamps
    end
  end
end
