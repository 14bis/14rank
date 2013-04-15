Deface::Override.new(:virtual_path => "spree/providers/show",
                     :name => "add_reviews_to_provider",
                     :insert_after => "[data-hook='provider_show']",
                     :partial => "spree/shared/provider_reviews")