class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def indexz
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :desc)
    elsif params[:search]
      @tasks = Task.where("name LIKE ?", "%#{ params[:name_key] }%")
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end

  # def search
  #   @tasks = Task.where('year LIKE ?', "%#{params[:year]}%")
  #   render :index
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
    params.require(:task).permit(:name, :content, :deadline)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
