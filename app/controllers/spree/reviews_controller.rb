class Spree::ReviewsController < Spree::StoreController
  before_filter :load_data

  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.build
    @review.user = spree_current_user
    @review.attributes = params[:product_review]
    
    if @review.save
      flash[:notice] = t('review_successfully_submitted')
      redirect_to product_path(@product)
    else
      render :action => "new"
    end
  end

  def load_data
    @product = Spree::Product.find_by_permalink(params[:product_id])
  end
end