class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
    @user = current_user
    @username = @user.username
  end
end
