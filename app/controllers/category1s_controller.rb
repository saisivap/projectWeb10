class Category1sController < ApplicationController
  before_action :set_category1, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit,:update,:new]
  # GET /category1s
  # GET /category1s.json
  def index
    @category1s = Category1.all.order("id")
  end

  # GET /category1s/1
  # GET /category1s/1.json
  def show
  end

  # GET /category1s/new
  def new
    @category1 = Category1.new
  end

  # GET /category1s/1/edit
  def edit
  end

  # POST /category1s
  # POST /category1s.json
  def create
    @category1 = Category1.new(category1_params)

    respond_to do |format|
      if @category1.save
        format.html { redirect_to @category1, notice: 'Category1 was successfully created.' }
        format.json { render :show, status: :created, location: @category1 }
      else
        format.html { render :new }
        format.json { render json: @category1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category1s/1
  # PATCH/PUT /category1s/1.json
  def update
    respond_to do |format|
      if @category1.update(category1_params)
        format.html { redirect_to @category1, notice: 'Category1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @category1 }
      else
        format.html { render :edit }
        format.json { render json: @category1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category1s/1
  # DELETE /category1s/1.json
  def destroy
    @category1.destroy
    respond_to do |format|
      format.html { redirect_to category1s_url, notice: 'Category1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category1
      @category1 = Category1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category1_params
      params.require(:category1).permit(:name,:image)
    end
end
