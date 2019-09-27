class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_task
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  PER = 8

  def index
    @tasks = @current_user.tasks.where(user_id: @current_user.id)
    if params[:sort_expired]
      @tasks = @current_user.tasks.page(params[:page]).per(PER).order(deadline: :desc)
    elsif params[:sort_priority]
      @tasks = @current_user.tasks.page(params[:page]).per(PER).order(priority: :asc)
    elsif params[:name]
      @tasks = Task.task(params)
      # .where("name LIKE ?", "%#{ params[:name] }%").where('status::text LIKE ?', "%#{params[:status]}%").where("label")
    elsif params[:label_id].present?
      @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] })
    else
      @tasks = @current_user.tasks.page(params[:page]).per(PER).order(created_at: :desc)
    end
    # @tasks = Task.where(user_id: current_user.id)
    @task = @tasks.page(params[:page]).per(PER)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    binding.pry
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
    params.require(:task).permit(:name, :content, :deadline, :status, :search, :priority, :page, labelings_attributes: [:id, :task_id, :label_id], label_ids: [] )
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
