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


  private

  def tesk_params
    params_require(:task).permit(:name, :content)
  end
end
