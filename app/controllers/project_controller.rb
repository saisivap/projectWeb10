class ProjectController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def profile
    @user=User.find(params[:id])
  end
end
