class CreateSwims < ActiveRecord::Migration
  def change
    create_table :swims do |t|
      t.index :athlete_id
      t.index :heat_id
      t.boolean :realy_start

      t.timestamps
    end
  end
end
