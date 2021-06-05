class AddDeletedAtToResumeSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :resume_skills, :deleted_at, :datetime
  end
end
