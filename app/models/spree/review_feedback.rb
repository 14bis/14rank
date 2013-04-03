class Spree::ReviewFeedback < ActiveRecord::Base
  attr_accessible :rating
  belongs_to :review
  belongs_to :user, :class_name => Spree.user_class.to_s

  validates_numericality_of :rating, :only_integer => true, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 1
  validates :user,  :presence => true
  validates :review,  :presence => true
end