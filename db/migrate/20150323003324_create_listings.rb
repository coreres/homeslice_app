class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true
      t.integer :task
      t.integer :status
      t.timestamps null: false
    end
    add_foreign_key :listings, :users
  end
end
