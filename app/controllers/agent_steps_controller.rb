class AgentStepsController < ApplicationController
  include Wicked::Wizard
  steps :agent_info, :broker_info, :payment_info

  def show
    @user = current_user
    render_wizard
  end
end
