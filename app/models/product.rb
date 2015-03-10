class Product < ActiveRecord::Base
  has_many :reviews

  def review_avarage
    self.reviews.average(:rate).round if self.reviews.present?
  end
end
