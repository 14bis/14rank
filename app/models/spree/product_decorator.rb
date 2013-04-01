Spree::Product.class_eval do
  has_many :reviews, :class_name => "Spree::ProductReview"
end