class AddDeletedAtToAddOns < ActiveRecord::Migration[6.0]
  def change
    add_column :add_ons, :deleted_at, :datetime
  end
end
