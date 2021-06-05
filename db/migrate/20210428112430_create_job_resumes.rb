class CreateJobResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :job_resumes do |t|
      t.integer :job_id
      t.integer :resume_id
      t.timestamps null: false
    end
  end
end
