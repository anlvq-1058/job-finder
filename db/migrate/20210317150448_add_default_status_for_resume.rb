class AddDefaultStatusForResume < ActiveRecord::Migration[6.0]
  def up
    change_column_default :resumes, :status, 0
  end

  def down 
    change_column_default :resumes, :status, nil
  end
end
