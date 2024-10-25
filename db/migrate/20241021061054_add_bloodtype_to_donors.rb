class AddBloodtypeToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :bloodtype, :string
  end
end
