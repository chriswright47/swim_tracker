class AddVarsityToEvents < ActiveRecord::Migration
  def change
    add_column :events, :varsity, :boolean
  end
end
