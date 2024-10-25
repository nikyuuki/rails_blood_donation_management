class RemoveAppointmentIdFromStaff < ActiveRecord::Migration[7.2]
  def change
    remove_column :staffs, :appointment_id, :string
  end
end
