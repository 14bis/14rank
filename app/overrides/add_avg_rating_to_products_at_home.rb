Deface::Override.new(:virtual_path => "spree/shared/_products",
                     :name => "add_avg_rating",
                     :insert_after => "div.product-image",
                     :text => "<%= show_rate product.avg_rating %>")