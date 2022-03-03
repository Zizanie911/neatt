class RemoveColumnTasksDate < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :date, :Date
  end
end
