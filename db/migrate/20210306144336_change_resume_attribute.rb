class ChangeResumeAttribute < ActiveRecord::Migration[6.0]
  def up
    change_column :add_ons, :time, :string
    add_column :users, :status, :integer, default: 0
    add_column :resumes, :position, :string
  end

  def down
    change_column :add_ons, :time, :date
    remove_column :resumes, :position, :string
    remove_column :users, :status, :integer
  end
end
