class AddDefaultGenderToJob < ActiveRecord::Migration[6.0]
  def up
    change_column :jobs, :gender, :integer, default: 0
  end

  def down
    change_column :jobs, :gender, :integer, default: nil
  end
end
