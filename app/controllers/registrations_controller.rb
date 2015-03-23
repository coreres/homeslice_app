class RegistrationsController < Devise::RegistrationsController

  def new
    @role = params[:role]
    if @role && ENV["ROLES"].include?(@role) && @role != "admin"
      super
    else
      redirect_to root_path
    end
  end

  private
  def build_resource(*args)
    super
    if params[:role]
      resource.add_role(params[:role])
    end
  end
end