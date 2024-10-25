class Appointment < ApplicationRecord
  belongs_to :bagblood
  belongs_to :donor
  belongs_to :staff
end
