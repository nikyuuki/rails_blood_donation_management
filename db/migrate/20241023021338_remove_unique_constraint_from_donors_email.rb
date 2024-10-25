class RemoveUniqueConstraintFromDonorsEmail < ActiveRecord::Migration[7.2]
  def change
    remove_index :donors, :email if index_exists?(:donors, :email)
  end
end
