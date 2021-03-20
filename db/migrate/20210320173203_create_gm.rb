class CreateGm < ActiveRecord::Migration[6.1]
  def change
    create_table :gms do |t|
      t.string :gm_first_name
      t.string :gm_last_name 
      t.string :gm_username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
