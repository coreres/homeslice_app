class AddManagingBrokerToAgentAccount < ActiveRecord::Migration
  def change
    add_column :agent_accounts, :managing_broker, :boolean
    add_column :agent_accounts, :managing_broker_name, :string
    add_column :agent_accounts, :direct_payment, :boolean
  end
end
