class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :JobNumber
      t.string :CompanyName
      t.timestamps
    end
  end
end
