class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :stroke
      t.integer :distance
      t.boolean :relay, :null => false, :default => false

      t.timestamps
    end
  end
end
