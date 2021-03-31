class CreateBartenders < ActiveRecord::Migration[6.1]
  def change
    create_table :bartenders do |t|
      t.string :username 
      t.string :email
      t.string :password_digest
      t.text :about

      t.timestamps
    end
  end
end
