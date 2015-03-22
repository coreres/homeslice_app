class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :task, index: true
      t.decimal :amount
      t.date :trans_date
      t.time :trans_time

      t.timestamps null: false
    end
    add_foreign_key :transactions, :tasks
  end
end
