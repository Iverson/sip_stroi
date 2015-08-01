class AddImageAltToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :image_alt, :string
  end
end
