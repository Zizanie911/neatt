class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :details
      t.boolean :mark_as_done
      t.integer :priority
      t.datetime :start_at
      t.integer :duration
      t.integer :days, array: true

      t.timestamps
    end
  end
end
