class CreateChef < ActiveRecord::Migration[6.1]
  def change
    create_table :chefs do |t|
      t.string :chef_first_name
      t.string :chef_last_name 
      t.string :chef_username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
