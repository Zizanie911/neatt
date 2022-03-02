class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
    @user = current_user
    @username = @user.username
    @total = nb_total_tasks
    @nb_habits = nb_habits
    @nb_tasks = nb_tasks
    @estimated_time = estimated_time
    @regular_tasks = regular_tasks
  end

  private

  def regular_tasks
    @tasks.where(days: nil)
  end

  def habits
    @tasks.where.not(days: nil)
  end

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

  def estimated_time
    t = 0
    @tasks.each do |task|
      t += task.duration unless task.duration.nil?
    end
    if t >= 60
      h = t.modulo(60)
      mn = t - (h * 60)
      return "#{h}:#{mn}"
    end
    return "00:#{t}"
  end

  def mark_as_done
    @task = Task.find(params[:id])
    authorize @task
    @task.mark_as_done = !@task.mark_as_done
    @task.save
    redirect_to tasks_path
  end

end
