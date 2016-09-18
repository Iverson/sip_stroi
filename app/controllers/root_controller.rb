class RootController < ApplicationController
  def index
    @projects = Project.published.sorted_by_area
    @reviews  = Review.all
    @photos   = Photo.all
    @offers   = Offer.all
  end
end
