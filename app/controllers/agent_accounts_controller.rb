class AgentAccountsController < ApplicationController
  class AgentAccountsController < ApplicationController
    before_action :load_agent_account, only: [:show, :update, :edit, :destroy]
    before_action :load_wizard, only: [:new, :edit, :create, :update]
    layout 'form'

    def index
      # @agent_accounts = AgentAccount.all
    end

    def show
    end

    def new
      @agent_account = @wizard.object
    end

    def edit
    end

    def create
      @agent_account = @wizard.object
      if @wizard.save
        redirect_to @agent_account, notice: "Agent Account saved!"
      else
        render :new
      end
    end

    def update
      if @wizard.save
        redirect_to @agent_account, notice: 'Agent Account was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @agent_account.destroy
      redirect_to agent_account_url
    end

    private

    def load_agent_account
      @agent_account = AgentAccount.find(params[:id])
    end

    def load_wizard
      @wizard = ModelWizard.new(@agent_account || AgentAccount, session, params)
      if self.action_name.in? %w[new edit]
        @wizard.start
      elsif self.action_name.in? %w[create update]
        @wizard.process
      end
    end

  end

end
