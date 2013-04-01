Provider.class_eval do
  has_many :reviews, :class_name => "Spree::ProviderReview"
end