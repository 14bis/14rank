class Spree::ReviewsAbility
  include CanCan::Ability
  
  def initialize(user)
    user ||= Spree::User.new # guest user

    can :read, :all

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('user')
      can [:create, :update, :destroy], Spree::Review, :user_id => user.id
      can [:upvote, :downvote] , Spree::Review
    end

  end
  
end
