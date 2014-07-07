class CreateTimerecords < ActiveRecord::Migration
  def change
    create_table :timerecords do |t|
      t.string :jobnumber
      t.belongs_to :user
      t.belongs_to :task
      t.datetime :timein
      t.datetime :timeout
      t.timestamps
    end
  end
end
