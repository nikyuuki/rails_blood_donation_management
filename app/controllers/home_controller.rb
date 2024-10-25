class HomeController < ApplicationController
  def dashboard
    @total_donors = Donor.count 
    @total_appointments = Appointment.count 
    @total_bagbloods = Bagblood.count 
  end

  def index
  end
end
