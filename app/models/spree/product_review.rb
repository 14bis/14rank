class Spree::ProductReview < Spree::Review
  belongs_to :product
  validates :product,  :presence => true

  after_save :recalculate_product_rating
  after_destroy :recalculate_product_rating

  def recalculate_product_rating
    reviews_count = product.reviews.reload.count

    if reviews_count > 0
      product.avg_rating = product.reviews.sum(:rating).to_f / reviews_count
      product.save
    else
      product.update_attribute(:avg_rating, 0)
    end
  end

end