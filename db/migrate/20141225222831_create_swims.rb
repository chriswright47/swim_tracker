class CreateSwims < ActiveRecord::Migration
  def change
    create_table :swims do |t|
      t.integer :athlete_id
      t.integer :heat_id
      t.boolean :relay_start
      t.integer :final_time_ms
      t.text    :notes

      t.timestamps

      t.index :athlete_id
      t.index :heat_id
    end
  end
end
