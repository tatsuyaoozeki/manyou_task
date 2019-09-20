class Admin::UsersController < ApplicationController
  before_action :require_admin
  def index
    @users = User.includes(:task).all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  private

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

end
