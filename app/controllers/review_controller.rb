class ReviewController < ApplicationController
  layout 'review_site'
   before_action :get_ranking

  def get_ranking
    ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    @ranking = ids.map{|product_id| Product.find(product_id)}
  end

  def create
    Review.create(nickname: create_params[:nickname], rate: create_params[:rate], review: create_params[:review], product_id: create_params[:id])
    
    redirect_to "/"
  end

  private
  def create_params
    params.permit(:nickname, :rate, :review, :id)
  end

  

end
