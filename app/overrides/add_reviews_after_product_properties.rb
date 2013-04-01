Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_reviews",
                     :insert_after => "[data-hook='product_properties']",
                     :partial => "spree/shared/reviews")