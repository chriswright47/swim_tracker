class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :opponent
      t.date :competition_date

      t.timestamps
    end
  end
end
