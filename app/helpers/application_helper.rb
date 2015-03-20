module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | HomesliceRe"
    end
  end
end
