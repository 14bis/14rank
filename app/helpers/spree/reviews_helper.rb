module Spree::ReviewsHelper

  def show_rate(value)
    if value.nil? or value == 0
      content_tag("div", t(:not_rated), :class => 'rateit', :'data-rateit-readonly' => "true")
    else
      # factor = 1 / 0.5 # 1 / desired_precision
      # rounded = (value * factor).round / factor
      rounded = value.round(1)
      content_tag("div", nil, :class => 'rateit', :data => {:rateit_value => rounded.to_s, :rateit_ispreset => 'true', :rateit_readonly => "true"})
    end
  end

end