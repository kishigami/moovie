class TopController < ReviewController
  before_action :authenticate_user!, except: :index

  def index
    @products = Product.order("id ASC").limit(20)
  end

  def entry
    @product = Product.find(params[:id])
  end

  def search
    @search_results = Product.where('title LIKE(?)', "%#{params[:keyword]}%")
  end

  private


end
