class Spree::ReviewFeedback < ActiveRecord::Base
  attr_accessible :rating
  belongs_to :review
  belongs_to :user, :class_name => Spree.user_class.to_s
  validates :user_id, :uniqueness => { :scope => :review_id }

  validates_numericality_of :rating, :only_integer => true, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 1
  validates :user,  :presence => true
  validates :review,  :presence => true

  validate :user_cannot_vote_for_his_own_review, :on => :create
  def user_cannot_vote_for_his_own_review
    if user_id == review.user_id
      errors.add(:user, "can't vote for his own review")
    end
  end
end