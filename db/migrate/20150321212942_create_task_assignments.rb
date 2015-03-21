class CreateTaskAssignments < ActiveRecord::Migration
  def change
    create_table :task_assignments do |t|
      t.references :agent, index: true
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :task_assignments, :agents
    add_foreign_key :task_assignments, :tasks
  end
end
