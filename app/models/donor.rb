class Donor < ApplicationRecord
  # Associations
  has_many :appointments 
  has_many :bagbloods    

  # Validations
  validates :icnum, presence: true, uniqueness: true
end
