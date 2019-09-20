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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path, notice: 'ユーザー｢#{@user.name}｣を更新しました'
    else
      render :edit
    end
  end
  




  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

end
