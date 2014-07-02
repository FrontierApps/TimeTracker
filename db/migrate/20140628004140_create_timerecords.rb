class CreateTimerecords < ActiveRecord::Migration
  def change
    create_table :timerecords do |t|
      t.belongs_to :job
      t.string :task
      t.string :timein
      t.string :timeout
      t.timestamps
    end
  end
end
