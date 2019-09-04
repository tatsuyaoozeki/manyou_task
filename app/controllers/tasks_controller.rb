class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect task_path, notice: "タスクを作成しました!"
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end



  private

  def task_params
    params_require(:task).permit(:name, :content)
  end
end
