class Spree::ReviewsController < Spree::StoreController
  load_resource :product, :find_by => :permalink, :class => 'Spree::Product', :except => [:upvote, :downvote]
  load_resource :provider, :except => [:upvote, :downvote]
  load_and_authorize_resource :review, :class => 'Spree::Review', :through => [:product, :provider], :except => [:upvote, :downvote]
  load_and_authorize_resource :review, :class => 'Spree::Review', :only => [:upvote, :downvote]

  def current_ability
    @current_ability ||= Spree::ReviewsAbility.new(spree_current_user)
  end

  def new
  end

  def create
    @review.user = spree_current_user
    @review.location = I18n.locale
    @review.attributes = params.has_key?(:product_review) ? params[:product_review] : params[:provider_review]
    
    if @review.save
      flash[:notice] = t('review_successfully_submitted')
      redirect_to @review.parent
    else
      render :action => "new"
    end
  end

  def upvote
    @review_feedback = @review.liked_by spree_current_user
    redirect_to @review.parent
  end

  def downvote
    @review_feedback = @review.disliked_by spree_current_user
    redirect_to @review.parent
  end

end