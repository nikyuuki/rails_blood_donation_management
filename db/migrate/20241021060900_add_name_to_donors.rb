class AddNameToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :name, :string
  end
end
