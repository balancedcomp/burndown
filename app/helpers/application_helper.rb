module ApplicationHelper
  

  def icon(options={})
    content_tag :i, ' ', :class => "fa fa-#{options[:icon]} #{options[:css_classes]}"
  end
  
  def stacked_icon(options={})
    #%span.fa-stack
    #  %i.fa.fa-stop.fa-stack-2x
    #  %i.fa.fa-user.fa-stack-1x.fa-inverse
    
    content_tag :span, nil,class: 'fa-stack hidden-print' do
                content_tag(:i, nil, class: "a fa-circle fa-stack-2x #{options[:css_classes]}") +
                content_tag(:i, nil, class: "fa fa-#{options[:icon]}  fa-stack-1x fa-inverse")
    end
  end
  
end
