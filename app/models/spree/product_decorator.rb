Spree::Product.class_eval do
  has_many :reviews, :class_name => "Spree::ProductReview"
  attr_accessible :avg_rating
end