class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index

    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :desc)
    elsif params[:search]
      @tasks = Task.where("name LIKE ?", "%#{ params[:search] }%")
      # @tasks = Task.where("name LIKE ? AND status LIKE ?", "%#{ params[:search] }%")
    elsif params[:search] && params[:search][:status_search]
      @tasks = Task.where(:search).where("name LIKE ? AND status LIKE ?", "%#{ params[:search] }%", "%#{ params[:search][:status] }%")
    else
      @tasks = Task.all.order(created_at: :desc)
      # render :index
    end
  end

  # def list
  #   @task = Task.all
  #   @task_label = {0: '未着手', 1: '作業中', 2: '完了'}
  # end

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
    params.require(:task).permit(:name, :content, :deadline, :status, :search)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
