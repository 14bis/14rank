module Spree::ReviewsHelper

  def select_rate(select_id, selected, disabled)
    select_tag(select_id, options_for_select(0..5, selected), :disabled => disabled)
  end

  def show_rate(value)
    if value.nil? or value == 0
      content_tag("div", t(:not_rated), :class => 'rateit', :'data-rateit-readonly' => "true")
    else
      # factor = 1 / 0.5 # 1 / desired_precision
      # rounded = (value * factor).round / factor
      rounded = value.round(1)
      tag("div", :class => 'rateit', :data => {:rateit_value => rounded.to_s, :rateit_ispreset => 'true', :rateit_readonly => "true"})
    end
  end

end