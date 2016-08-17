class AddActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :tinyint, :limit => 1
  end
end
