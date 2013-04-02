class Spree::Review < ActiveRecord::Base
  attr_accessible :rating, :title, :comment
  attr_protected :location
  belongs_to :user, :class_name => Spree.user_class.to_s

  validates_numericality_of :rating, :greater_than => 0, :less_than_or_equal_to => 5
  validates :user,  :presence => true
  validates :title, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 10 }
end