class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.integer :meet_id
      t.integer :event_id
      t.integer :entry_limit

      t.timestamps

      t.index :meet_id
      t.index :event_id
    end
  end
end
