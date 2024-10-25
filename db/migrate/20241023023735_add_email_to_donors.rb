class AddEmailToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :email, :string
  end
end
