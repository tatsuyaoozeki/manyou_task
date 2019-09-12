class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index

    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :desc)
    elsif params[:search]
      @tasks = Task.where("name LIKE ?", "%#{ params[:search] }%")
    elsif params[:status_search]
      @tasks = Task.where("status LIKE ?", "%#{ params[:status_search] }%")
  elsif params[:search] && params[:search][:status_search]
      @tasks = Task.where("name LIKE ? AND status LIKE ?", "%#{ params[:search] }%", "%#{ params[:search][:status_search] }%")
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.success')
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('.success')
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t('.success')
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :deadline, :status, :search, :status_search)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
