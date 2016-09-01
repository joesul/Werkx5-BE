class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :username
      t.string :job_name
      t.string :zip
      t.string :offer
      t.string :description
      t.string :worker
      t.string :job_status
      t.timestamps
    end
  end
end
