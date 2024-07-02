class ProducttsController < ApplicationController
  before_action :set_productt, only: %i[ show edit update destroy ]

  # GET /productts or /productts.json
  def index
    @productts = Productt.all
  end

  # GET /productts/1 or /productts/1.json
  def show
  end

  # GET /productts/new
  def new
    @productt = Productt.new
  end

  # GET /productts/1/edit
  def edit
  end

  # POST /productts or /productts.json
  def create
    @productt = Productt.new(productt_params)

    respond_to do |format|
      if @productt.save
        format.html { redirect_to productt_url(@productt), notice: "Productt was successfully created." }
        format.json { render :show, status: :created, location: @productt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @productt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productts/1 or /productts/1.json
  def update
    respond_to do |format|
      if @productt.update(productt_params)
        format.html { redirect_to productt_url(@productt), notice: "Productt was successfully updated." }
        format.json { render :show, status: :ok, location: @productt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @productt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productts/1 or /productts/1.json
  def destroy
    @productt.destroy

    respond_to do |format|
      format.html { redirect_to productts_url, notice: "Productt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productt
      @productt = Productt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def productt_params
      params.require(:productt).permit(:name)
    end
end
