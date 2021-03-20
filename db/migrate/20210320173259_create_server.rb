class CreateServer < ActiveRecord::Migration[6.1]
  def change
    create_table :servers do |t|
      t.string :server_first_name
      t.string :server_last_name 
      t.string :server_username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
