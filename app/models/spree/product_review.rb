class Spree::ProductReview < Spree::Review
  belongs_to :product
  validates :product,  :presence => true
  validates :user_id, :uniqueness => { :scope => :product_id }

  def parent_model_name
    Spree::Product.model_name
  end

end