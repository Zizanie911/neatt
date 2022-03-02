class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
    @user = current_user
    @username = @user.username
    @total = nb_total_tasks
    @nb_habits = nb_habits
    @nb_tasks = nb_tasks
  end

  private

  def nb_total_tasks
    @tasks.count
  end

  def nb_habits
    nb = 0
    @tasks.each do |task|
      nb += 1 if task.days.nil?
    end
    return nb
  end

  def nb_tasks
    return nb_total_tasks - nb_habits
  end
end
