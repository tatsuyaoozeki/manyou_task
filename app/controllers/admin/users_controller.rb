class Admin::UsersController < ApplicationController
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


end
