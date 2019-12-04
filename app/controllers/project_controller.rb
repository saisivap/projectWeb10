class ProjectController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:adminorders]
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
  def booking
    # debugger
    @orders=Bcart.where("user_id":current_user[:id]).all

    # @items = Item.where("category1_id":params['category1_id']).all
    # debugger
    str=''
    total=0
    @orders.each do |order|
      str=(order.item.id).to_s+','+str
      total=total+order.item.price
      order.delete
    end
    str
    @booking=Booking.new
    @booking.items=str
    @booking.user_id=current_user[:id]
    @booking.total=total
    # debugger
    respond_to do |format|
      if @booking.save
        # debugger
        # format.html { redirect_to @bcart, notice: 'Bcart was successfully created.' }
        # format.html { redirect_back fallback_location: root_path, notice: 'Booking was Done.' }
        format.html { redirect_to root_path, notice: 'Booking Was success' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
    # debugger
  end

  def myposts
    # debugger
    @myposts=Post.where("user_id":current_user[:id]).all.order("created_at DESC")
  end
  def myorders
    @myorders=Booking.where("user_id":current_user[:id]).all
    # @myoders.each do |mo|
    #
    # end
  end
  def adminorders
    @myadminorders=Booking.all
  end
  def payment
    @booking=Booking.find(params["booking_id"])
    @booking.is_payed=true
    # @booking.save
    respond_to do |format|
      if @booking.save
        # debugger
        # format.html { redirect_to @bcart, notice: 'Bcart was successfully created.' }
        # format.html { redirect_back fallback_location: root_path, notice: 'Booking was Done.' }
        format.html { redirect_to myadminorders_path, notice: 'Booking Was success' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  # private
  # def bcart_params
  #   params.require(:bcart).permit(:item_id, :user_id)
  # end
end
