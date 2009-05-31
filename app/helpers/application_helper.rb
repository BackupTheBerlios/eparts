# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def val_color( val )
    if val < 0
      return "style=\"color:red\""
    end
  end

  def val_color_tab( val )
    if val < 0
      return "<font color=\"red\">"
    end
    if val > 0
      return "<font color=\"green\">"
    end
  end
end
