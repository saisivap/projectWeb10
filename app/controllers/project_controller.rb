class ProjectController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def profile
    @user=User.find(params[:id])
  end
  def add
    # session[:cart] ||= {}
    # session[:cart][params["item_id"]] ||= 0
    # session[:cart][params["item_id"]] += 1
    # debugger
    #     session[:cart] ||= []
    #     cart << `some data`
    #     debugger
    #
    @bcart = Bcart.new
    @bcart.user_id=current_user[:id]
    @bcart.item_id=params["item_id"]
    # debugger
    respond_to do |format|
      if @bcart.save
        # format.html { redirect_to @bcart, notice: 'Bcart was successfully created.' }
        format.html { redirect_back fallback_location: root_path, notice: 'Bcart was successfully created.' }
        format.json { render :show, status: :created, location: @bcart }
      else
        format.html { render :new }
        format.json { render json: @bcart.errors, status: :unprocessable_entity }
      end
    end
  end

  def cart

  end

  # private
  # def bcart_params
  #   params.require(:bcart).permit(:item_id, :user_id)
  # end
end
