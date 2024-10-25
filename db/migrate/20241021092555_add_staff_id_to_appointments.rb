class AddStaffIdToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :staff_id, :string
  end
end
