class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect new_task_path
  end

  def show

  end



  private

  def task_params
    params_require(:task).permit(:name, :content)
  end
end
