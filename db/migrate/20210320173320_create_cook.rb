class CreateCook < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.string :cook_first_name
      t.string :cook_last_name 
      t.string :cook_username
      t.string :password_digest

      t.timestamps
    end
  end
end
