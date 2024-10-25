class Bagblood < ApplicationRecord
  belongs_to :donor
  has_many :appointments, class_name: "appointment", foreign_key: "reference_id"
end
