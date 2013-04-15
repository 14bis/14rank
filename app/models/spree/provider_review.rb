class Spree::ProviderReview < Spree::Review
  belongs_to :provider
  validates :provider,  :presence => true
  validates :user_id, :uniqueness => { :scope => :provider_id }

  def parent_model_name
    Provider.model_name
  end
  
end