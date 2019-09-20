class Admin::UsersController < ApplicationController
  before_action :require_admin
  def index
    @users = User.includes(:task).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path, notice: 'ユーザー｢#{@user.name}」を登録しました'
    else
      render :new
    end
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
