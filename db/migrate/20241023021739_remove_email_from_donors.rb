class RemoveEmailFromDonors < ActiveRecord::Migration[7.2]
  def change
    remove_column :donors, :email, :string
  end
end
