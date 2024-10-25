class BagbloodsController < ApplicationController
  before_action :set_bagblood, only: %i[ show edit update destroy ]

  # GET /bagbloods or /bagbloods.json
  def index
    if params[:search].present?
      @bagbloods = Bagblood.joins(:donor).where("bagbloods.id LIKE ? OR bagbloods.volume LIKE ? OR donors.bloodtype LIKE ?", 
                            "%#{params[:search]}%", 
                            "%#{params[:search]}%", 
                            "%#{params[:search]}%")
    else
      @bagbloods = Bagblood.all
    end
  end

  # GET /bagbloods/1 or /bagbloods/1.json
  def show
  end

  # GET /bagbloods/new
  def new
    @bagblood = Bagblood.new
  end

  # GET /bagbloods/1/edit
  def edit
  end

  # POST /bagbloods or /bagbloods.json
  def create
    @bagblood = Bagblood.new(bagblood_params)

    respond_to do |format|
      if @bagblood.save
        format.html { redirect_to @bagblood, notice: "Bagblood was successfully created." }
        format.json { render :show, status: :created, location: @bagblood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bagblood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bagbloods/1 or /bagbloods/1.json
  def update
    respond_to do |format|
      if @bagblood.update(bagblood_params)
        format.html { redirect_to @bagblood, notice: "Bagblood was successfully updated." }
        format.json { render :show, status: :ok, location: @bagblood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bagblood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bagbloods/1 or /bagbloods/1.json
  def destroy
    @bagblood.destroy!

    respond_to do |format|
      format.html { redirect_to bagbloods_path, status: :see_other, notice: "Bagblood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bagblood
      @bagblood = Bagblood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bagblood_params
      params.require(:bagblood).permit(:volume, :donor_id)
    end
end
