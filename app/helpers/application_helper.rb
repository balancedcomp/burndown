module ApplicationHelper
  

  def icon(options={})
    content_tag :i, ' ', :class => "fa fa-#{options[:icon]} #{options[:css_classes]}"
  end
    
  
end
