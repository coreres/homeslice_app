class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :task, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :tasks
    add_foreign_key :comments, :users
  end
end
