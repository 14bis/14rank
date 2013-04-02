Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_reviews",
                     :insert_after => "[data-hook='product_show']",
                     :partial => "spree/shared/reviews")