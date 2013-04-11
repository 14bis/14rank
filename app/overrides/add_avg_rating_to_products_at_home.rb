Deface::Override.new(:virtual_path => "spree/shared/_products",
                     :name => "add_avg_rating",
                     :insert_after => "div.product-image",
                     :text => "<%= show_rate product.avg_rating %>")
Deface::Override.new(:virtual_path => "spree/shared/_products",
                     :name => "add_rateit_assets",
                     :insert_before => "ul#products",
                     :partial => "spree/shared/rateit_head")