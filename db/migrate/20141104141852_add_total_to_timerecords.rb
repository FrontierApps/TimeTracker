class AddTotalToTimerecords < ActiveRecord::Migration
  def change
  	add_column :timerecords, :total, :float 
  end
end
