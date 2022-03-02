class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)

  end

  def mark_as_done
    @task = Task.find(params[:id])
    authorize @task
    @task.mark_as_done = !@task.mark_as_done
    @task.save
    redirect_to tasks_path
  end

end
