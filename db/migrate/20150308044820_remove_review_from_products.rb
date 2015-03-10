class RemoveReviewFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :review, :text
    add_column :products, :detail, :text
  end
end
