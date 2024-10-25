class RemoveDonorIdFromStaff < ActiveRecord::Migration[7.2]
  def change
    remove_column :staffs, :donor_id, :string
  end
end
