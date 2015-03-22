class AgentsController < UsersController

  def show
    @user = Agent.find(params[:id])
  end
end
