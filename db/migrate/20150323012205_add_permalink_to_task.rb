class AddPermalinkToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :permalink, :string
  end
end
