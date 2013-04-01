class Spree::Review < ActiveRecord::Base
  attr_accessible :rating
  belongs_to :user, :class_name => Spree.user_class.to_s
  validates_numericality_of :rating
end