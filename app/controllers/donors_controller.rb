class DonorsController < ApplicationController
  before_action :set_donor, only: %i[ show edit update destroy ]

  # GET /donors or /donors.json
  def index
    if params[:search].present?
      @donors = Donor.where("name LIKE ? OR phone LIKE ? OR icnum LIKE ?", 
                            "%#{params[:search]}%", 
                            "%#{params[:search]}%", 
                            "%#{params[:search]}%")
    else
      @donors = Donor.all
    end
  end

  # GET /donors/1 or /donors/1.json
  def show
  end

  # GET /donors/new
  def new
    @donor = Donor.new
  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors or /donors.json
  def create
    @donor = Donor.new(donor_params)

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: "Donor was successfully created." }
        format.json { render :show, status: :created, location: @donor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donors/1 or /donors/1.json
  def update
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: "Donor was successfully updated." }
        format.json { render :show, status: :ok, location: @donor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1 or /donors/1.json
  def destroy
    @donor.destroy!

    respond_to do |format|
      format.html { redirect_to donors_path, status: :see_other, notice: "Donor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donor_params
      params.require(:donor).permit(:name, :donor, :phone, :icnum, :bloodtype)
    end
end
