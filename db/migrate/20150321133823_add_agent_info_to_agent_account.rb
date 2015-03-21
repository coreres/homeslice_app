class AddAgentInfoToAgentAccount < ActiveRecord::Migration
  def change
    add_column :agent_accounts, :license_number, :string
    add_column :agent_accounts, :license_expiration, :date
    add_column :agent_accounts, :mobile_phone, :string
    add_column :agent_accounts, :agent_physical_address, :string
    add_column :agent_accounts, :agent_city, :string
    add_column :agent_accounts, :agent_state, :string
    add_column :agent_accounts, :agent_zip, :string
    add_column :agent_accounts, :company_name, :string
    add_column :agent_accounts, :company_address, :string
    add_column :agent_accounts, :company_city, :string
    add_column :agent_accounts, :company_state, :string
    add_column :agent_accounts, :company_zip, :string
    add_column :agent_accounts, :company_phone, :string
    add_column :agent_accounts, :company_fax, :string
    add_column :agent_accounts, :broker_name, :string
    add_column :agent_accounts, :checks_payable_to, :string
    add_column :agent_accounts, :payment_address, :string
    add_column :agent_accounts, :payment_city, :string
    add_column :agent_accounts, :payment_state, :string
    add_column :agent_accounts, :payment_zip, :string

  end
end
