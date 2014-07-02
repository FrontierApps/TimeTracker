class CreateTimerecords < ActiveRecord::Migration
  def change
    create_table :timerecords do |t|
      belongs_to :employee
      belongs_to :job
      t.string 
      t.timestamps
    end
  end
end
