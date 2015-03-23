class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
