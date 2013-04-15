Provider.class_eval do
  has_many :reviews, :class_name => "Spree::ProviderReview"
  attr_accessible :avg_rating

  def rating_count value
    Spree::Review.where(:provider_id => self, :rating => value).count
  end
end