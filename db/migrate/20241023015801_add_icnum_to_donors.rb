class AddIcnumToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :icnum, :string
  end
end
