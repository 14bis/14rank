class Spree::ReviewsController < Spree::StoreController
  before_filter :load_data, :only => [:new, :create]

  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.build
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
    @review = Spree::Review.find(params[:id])
    @review.liked_by spree_current_user
    redirect_to @review.product
  end

  def downvote
    @review = Spree::Review.find(params[:id])
    @review.disliked_by spree_current_user
    redirect_to @review.product
  end

  def load_data
    @product = Spree::Product.find_by_permalink(params[:product_id])
  end
end