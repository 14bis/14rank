class Spree::ProviderReview < Spree::Review
  belongs_to :provider
  validates :provider,  :presence => true
end