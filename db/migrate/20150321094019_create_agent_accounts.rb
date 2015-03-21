class CreateAgentAccounts < ActiveRecord::Migration
  def change
    create_table :agent_accounts do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end