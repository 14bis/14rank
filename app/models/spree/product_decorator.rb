Spree::Product.class_eval do
  has_many :reviews, :class_name => "Spree::ProductReview"
  attr_accessible :avg_rating

  def rating_count value
    Spree::Review.where(:product_id => self, :rating => value).count
  end
end