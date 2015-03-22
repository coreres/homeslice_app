class CreateTaskApplications < ActiveRecord::Migration
  def change
    create_table :task_applications do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :task_applications, :users
    add_foreign_key :task_applications, :tasks
  end
end
