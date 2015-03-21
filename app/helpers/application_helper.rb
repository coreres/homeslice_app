module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def title(value)
    unless value.nil?
      @title = "#{value} | Homeslice"
    end
  end
end
