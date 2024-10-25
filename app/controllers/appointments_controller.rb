class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    if params[:search].present?
      @appointments = Appointment.joins(:donor, :bagblood, :staff).where("appointments.id LIKE ? OR appointments.session LIKE ? OR appointments.schedule LIKE ?
                                                                          OR donors.name LIKE ? OR staffs.name LIKE ? OR bagbloods.id LIKE ?", 
                                                                          "%#{params[:search]}%", 
                                                                          "%#{params[:search]}%", 
                                                                          "%#{params[:search]}%",
                                                                          "%#{params[:search]}%", 
                                                                          "%#{params[:search]}%", 
                                                                          "%#{params[:search]}%")
    else
      @appointments = Appointment.all
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
    @appointment = Appointment.includes(:donor, :bagblood, :staff).find(params[:id])
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @donor = Donor.all
    @bagblood = Bagblood.all
    @staff = Staff.all
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.includes(:donor, :bagblood, :staff).find(params[:id])
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_path, status: :see_other, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:session, :schedule, :bagblood_id, :donor_id, :staff_id)
    end
end
