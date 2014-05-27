class IterationDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  
  def date
    object.date.strftime('%a %b %e') rescue nil
  end
  
  def points_completed
    object.points_completed || "-"
  end
  
  
  def panel_class
    begin
      if object.date < Date.today
        if object.points_completed.nil? || object.points_completed < 1
          "iteration-failure"
        else
          "iteration-success"
        end
      end
    rescue
    end
  end
  
end
