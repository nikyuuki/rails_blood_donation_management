class AddPhoneToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :phone, :decimal
  end
end
