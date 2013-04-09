class Spree::ReviewsController < Spree::StoreController
  load_resource :product, :find_by => :permalink, :class => 'Spree::Product'
  load_and_authorize_resource :review, :class => 'Spree::ProductReview', :through => :product

  def current_ability
    @current_ability ||= Spree::ReviewsAbility.new(spree_current_user)
  end

  def new
  end

  def create
    @review.user = spree_current_user
    @review.location = I18n.locale
    @review.attributes = params[:product_review]
    
    if @review.save
      flash[:notice] = t('review_successfully_submitted')
      redirect_to @product
    else
      render :action => "new"
    end
  end

  def upvote
    @review.liked_by spree_current_user
    redirect_to @review.product
  end

  def downvote
    @review.disliked_by spree_current_user
    redirect_to @review.product
  end

end