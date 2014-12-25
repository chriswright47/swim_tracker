class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.index :meet_id
      t.index :event_id
      t.integer :entry_limit

      t.timestamps
    end
  end
end
