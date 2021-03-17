class AddAdressToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :address, :string
    add_column :companies, :avatar, :string
  end
end
