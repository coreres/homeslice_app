class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :short_description
      t.date :due_date_begin
      t.date :due_date_end
      t.time :start_time
      t.time :end_time
      t.references :user, index: true
      t.boolean :quickly
      t.integer :time_estimate
      t.string :location
      t.integer :status, default: 0
      t.integer :price
      t.integer :assigned_agent

      t.timestamps null: false
    end
    add_foreign_key :tasks, :users
  end
end
