class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_task
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  PER = 8

  def index
    if params[:sort_expired]
      @tasks = Task.order(deadline: :desc)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: :asc)
    elsif params[:name]
      @tasks = Task.task(params)
      # .where("name LIKE ?", "%#{ params[:name] }%").where('status::text LIKE ?', "%#{params[:status]}%")
    else
      @tasks = Task.all.order(created_at: :desc).page(params[:page]).per(PER)
    end
    @tasks = Task.where(user_id: current_user.id)
    @task = @tasks.page(params[:page]).per(PER)
  end

  def new
    @task = Task.new
    @task.labelings.build
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    params.require(:task).permit(:name, :content, :deadline, :status, :search, :priority, :page, which_label_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def require_task
    unless logged_in?
      redirect_to new_session_path, notice: 'ログインしてください'
    end
  end

  def ensure_correct_user
    @task = Task.find_by(id: params[:id])
    if @task.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to tasks_path
    end
  end
end
