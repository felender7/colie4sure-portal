class GaragesController < ApplicationController
  before_action :set_garage, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_garage, only:[:show]

  # GET /garages or /garages.json
  def index
    @garages = Garage.all
  end

  # GET /garages/1 or /garages/1.json
  def show
  end

  # GET /garages/new
  def new
    @garage = current_user.garages.build
  end

  # GET /garages/1/edit
  def edit
  end

  # POST /garages or /garages.json
  def create
    @garage = current_user.garages.build(garage_params)

    respond_to do |format|
      if @garage.save
        format.html { redirect_to @garage, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @garage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garages/1 or /garages/1.json
  def update
    respond_to do |format|
      if @garage.update(garage_params)
        format.html { redirect_to @garage, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @garage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garages/1 or /garages/1.json
  def destroy
    @garage.destroy
    respond_to do |format|
      format.html { redirect_to garages_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.friendly.find(params[:id])
    end

    def correct_user
    @garage = current_user.garages.find_by(params[:friendly])
        redirect_to garages_path, notice: "Not authorised to edit" if @garage.nil?
  end
  # check if  cars belongs to the correct user - current user
    def current_user_garage
      if user_signed_in?
        @garages = current_user.garages.order("created_at DESC")
     end
   end

    # Only allow a list of trusted parameters through.
    def garage_params
      params.require(:garage).permit(:make, :model, :license_plate, :year)
    end
end
