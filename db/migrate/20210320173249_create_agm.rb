class CreateAgm < ActiveRecord::Migration[6.1]
  def change
    create_table :agms do |t|
      t.string :agm_first_name
      t.string :agm_last_name 
      t.string :agm_username
      t.string :password_digest

      t.timestamps
    end
  end
end
