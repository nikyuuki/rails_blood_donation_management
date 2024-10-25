class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.integer :session
      t.date :schedule
      t.references :bagblood, null: false, foreign_key: true
      t.references :donor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
