class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @my_reviews = Review.where(user_id: current_user.id).order('created_at DESC')
  end
end
