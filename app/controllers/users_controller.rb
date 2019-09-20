class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  def new
    if logged_in?&.admin?
      redirect_to tasks_path, notice: 'すでにログインしています'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = '登録しました'
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def ensure_correct_user
    @task = Task.find_by(id: params[:id])
    if @task.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to tasks_path
    end
  end
end
