class AddStatusAndGenderToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :gender, :string
    add_column :athletes, :status, :string, :null => false, :default => 'active'
  end
end
