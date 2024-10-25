class RemoveIcnumFromDonors < ActiveRecord::Migration[7.2]
  def change
    remove_column :donors, :icnum, :decimal
  end
end
