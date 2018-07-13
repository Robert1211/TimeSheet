class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
    
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :project_id

      t.timestamps
    end
  end
end
