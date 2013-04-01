class Spree::Review < ActiveRecord::Base
  belongs_to :user, :class_name => Spree.user_class.to_s
  validates_numericality_of :rating
end