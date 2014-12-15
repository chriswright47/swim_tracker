class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :null => false, :index => true, :unique => true
      t.string :password_hash, :null => false
      t.string :password_salt, :null => false

      t.timestamps
    end
  end
end
