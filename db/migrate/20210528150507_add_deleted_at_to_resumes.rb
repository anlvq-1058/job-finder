class AddDeletedAtToResumes < ActiveRecord::Migration[6.0]
  def change
    add_column :resumes, :deleted_at, :datetime
  end
end
