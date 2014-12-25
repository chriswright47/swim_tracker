class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false

      t.timestamps
    end
  end
end
