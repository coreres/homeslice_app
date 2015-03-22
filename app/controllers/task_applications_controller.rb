class TaskApplicationsController < ApplicationController
  before_action :set_task_application, only: [:show, :edit, :update, :destroy]

  # GET /task_applications
  # GET /task_applications.json
  def index
    @task_applications = TaskApplication.all
  end

  # GET /task_applications/1
  # GET /task_applications/1.json
  def show
  end

  # GET /task_applications/new
  def new
    @task_application = TaskApplication.new
  end

  # GET /task_applications/1/edit
  def edit
  end

  # POST /task_applications
  # POST /task_applications.json
  def create
    @task_application = TaskApplication.new(task_application_params)

    respond_to do |format|
      if @task_application.save
        format.html { redirect_to @task_application, notice: 'Task application was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_application }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_applications/1
  # PATCH/PUT /task_applications/1.json
  def update
    respond_to do |format|
      if @task_application.update(task_application_params)
        format.html { redirect_to @task_application, notice: 'Task application was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @task_application }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_applications/1
  # DELETE /task_applications/1.json
  def destroy
    @task_application.destroy
    respond_to do |format|
      format.html { redirect_to task_applications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_application
      @task_application = TaskApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_application_params
      params.require(:task_application).permit(:user_id, :task_id, :status)
    end
end
