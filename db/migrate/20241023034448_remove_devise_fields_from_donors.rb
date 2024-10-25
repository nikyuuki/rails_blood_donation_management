class RemoveDeviseFieldsFromDonors < ActiveRecord::Migration[7.2]
  def change
    remove_column :donors, :encrypted_password, :string
  end
end
