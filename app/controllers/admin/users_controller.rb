class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :if_not_admin

  def index
    @users = User.includes(:tasks).all
  end

  def new
    @user = User.new
    @admin = current_user.admin if current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザー｢#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path, notice: "ユーザー｢#{@user.name}｣を更新しました"
    else
      render :edit
    end
  end

  def destroy
    # @user.destroy
    if User.where(admin: true).count <= 1 && @user.admin?
      #@user = User.find(params[:id])
      redirect_to admin_users_path, notice: "ユーザー｢#{@user.name}｣は削除できません"
    # elsif User.where(admin: true).count > 1 && current_user.id == @user.id
    #   redirect_to new_session_path
    else
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザー｢#{@user.name}｣を削除しました"
    end
  end

  def change_admin
    @user = User.find(params[:id])
    if @user.admin == false
      @user.admin = true
      @user.save
      flash[:success] = '管理者権限を与えました'
      redirect_to admin_users_path
    elsif @user.admin == true && @user.id == current_user.id
      @user.admin = false
      @user.save
      flash[:success] = '管理者権限を無くしました'
      redirect_to tasks_path
    else
      @user.admin = false
      @user.save
      flash[:success] = '管理者権限は与えられていません'
      redirect_to admin_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def if_not_admin
    unless current_user.admin?
      redirect_to tasks_path
    end
  end

end
