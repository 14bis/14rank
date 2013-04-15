class Spree::Review < ActiveRecord::Base
  attr_accessible :rating, :title, :comment
  attr_protected :location
  belongs_to :user, :class_name => Spree.user_class.to_s
  belongs_to :provider
  belongs_to :product, :class_name => "Spree::Product"
  has_many :feedbacks, :class_name => "Spree::ReviewFeedback"

  validates_numericality_of :rating, :greater_than => 0, :less_than_or_equal_to => 5
  validates :user,  :presence => true
  validates :title, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 10 }

  def liked_by user
    review_feedback = self.feedbacks.build
    review_feedback.user = user
    review_feedback.rating = 1
    review_feedback.save
    return review_feedback
  end

  def disliked_by user
    review_feedback = self.feedbacks.build
    review_feedback.user = user
    review_feedback.rating = -1
    review_feedback.save
    return review_feedback
  end

  def liked_count
    Spree::ReviewFeedback.where(:review_id => self, :rating => 1).count
  end

  def disliked_count
    Spree::ReviewFeedback.where(:review_id => self, :rating => -1).count
  end

  def parent
    product.nil? ? provider : product
  end

  after_save :recalculate_parent_rating
  after_destroy :recalculate_parent_rating

  def recalculate_parent_rating
    reviews_count = parent.reviews.reload.count

    if reviews_count > 0
      parent.avg_rating = parent.reviews.sum(:rating).to_f / reviews_count
      parent.save
    else
      parent.update_attribute(:avg_rating, 0)
    end
  end

end