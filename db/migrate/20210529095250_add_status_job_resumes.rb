class AddStatusJobResumes < ActiveRecord::Migration[6.0]
  def change
    add_column :job_resumes, :status, :integer, default: 0
  end
end
