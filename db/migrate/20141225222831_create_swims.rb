class CreateSwims < ActiveRecord::Migration
  def change
    create_table :swims do |t|
      t.integer :athlete_id
      t.integer :heat_id
      t.boolean :realy_start

      t.timestamps

      t.index :athlete_id
      t.index :heat_id
    end
  end
end
