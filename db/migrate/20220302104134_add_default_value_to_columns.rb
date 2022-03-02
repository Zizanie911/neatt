class AddDefaultValueToColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :mark_as_done, false
    change_column_default :tasks, :priority, 3
  end
end
