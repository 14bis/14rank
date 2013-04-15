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
  end

  def disliked_by user
    review_feedback = self.feedbacks.build
    review_feedback.user = user
    review_feedback.rating = -1
    review_feedback.save
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

end