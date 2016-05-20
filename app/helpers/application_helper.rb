module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "flash-alert notice"
      when 'success' then "flash-alert success"
      when 'error' then "flash-alert error"
      when 'alert' then "flash-alert warning"
    end
  end

  def flash_heading(level)
    case level
      when 'notice' then "FYI, something just happened!"
      when 'success' then "Congrats, you did it!"
      when 'error' then "Ups, an error ocurred"
      when 'alert' then "Wait, I must warn you!"
    end
  end
end
