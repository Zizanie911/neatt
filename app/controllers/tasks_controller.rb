class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task
    raise
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :details, :priority, :start_at, :duration, days:[])
  end

end
