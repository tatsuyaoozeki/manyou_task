class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 8
  def index
    if params[:sort_expired] == 'true'
      @tasks = Task.order(deadline: :desc)
    elsif params[:sort_priority] == 'true'
      @tasks = Task.all.order(priority: :asc)
    elsif params[:name]
      @tasks = Task.task(params)
      # .where("name LIKE ?", "%#{ params[:name] }%").where('status::text LIKE ?', "%#{params[:status]}%")
    else
      @tasks = Task.all.order(created_at: :desc).page(params[:page]).per(PER)
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
    params.require(:task).permit(:name, :content, :deadline, :status, :search, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
