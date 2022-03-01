class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
    authorize @task
  end
end
