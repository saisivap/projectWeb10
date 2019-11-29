class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # def authenticate_user!
  #   if user_signed_in?
  #     redirect_to site_index_path
  #   else
  #     redirect_to root_path
  #     # redirect_to login_path, :notice => 'if you want to add a notice'
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  #   end
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:stID,:phone_number,:country,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:stID,:phone_number,:country,:image])
  end
  def admin_user
    redirect_to(root_path) unless current_user && current_user.admin?
  end

  def show_the_cart_items

  end
end
