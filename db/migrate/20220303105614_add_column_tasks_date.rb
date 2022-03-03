class AddColumnTasksDate < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :date, :Date
  end
end
