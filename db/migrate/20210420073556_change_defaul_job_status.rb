class ChangeDefaulJobStatus < ActiveRecord::Migration[6.0]
  def up
    change_column :jobs, :status, :integer, default: 0
  end

  def down
    change_column :jobs, :status, :integer, default: nil
  end
end
