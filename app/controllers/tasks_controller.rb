class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save!
      redirect_to root_path
    end
  end

  def client
    authorize!
  end

  def agent
    authorize!
  end


  private
  def task_params
    params.require(:task).permit(:title, :short_description, :due_date_begin, :due_date_end,
    :start_time, :end_time, :user_id, :quickly,:time_estimate, :location, :status, :price,:assigned_agent,
    :latitude, :longitude)
  end

end
