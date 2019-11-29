class BcartsController < ApplicationController
  before_action :set_bcart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /bcarts
  # GET /bcarts.json
  def index
    # @bcarts = Bcart.all
    #
    #
    #@items = Item.where("category1_id":params['category1_id']).all
    @bcarts=Bcart.where("user_id":current_user[:id]).all
  end

  # GET /bcarts/1
  # GET /bcarts/1.json
  def show
  end

  # GET /bcarts/new
  def new
    @bcart = Bcart.new
  end

  # GET /bcarts/1/edit
  def edit
  end

  # POST /bcarts
  # POST /bcarts.json
  def create
    @bcart = Bcart.new(bcart_params)

    respond_to do |format|
      if @bcart.save
        format.html { redirect_to @bcart, notice: 'Bcart was successfully created.' }
        format.json { render :show, status: :created, location: @bcart }
      else
        format.html { render :new }
        format.json { render json: @bcart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bcarts/1
  # PATCH/PUT /bcarts/1.json
  def update
    respond_to do |format|
      if @bcart.update(bcart_params)
        format.html { redirect_to @bcart, notice: 'Bcart was successfully updated.' }
        format.json { render :show, status: :ok, location: @bcart }
      else
        format.html { render :edit }
        format.json { render json: @bcart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bcarts/1
  # DELETE /bcarts/1.json
  def destroy
    @bcart.destroy
    respond_to do |format|
      format.html { redirect_to bcarts_url, notice: 'Bcart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bcart
      @bcart = Bcart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bcart_params
      params.require(:bcart).permit(:item_id, :user_id)
    end
end
