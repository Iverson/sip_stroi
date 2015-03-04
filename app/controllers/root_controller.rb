class RootController < ApplicationController
  def index
    @projects = Project.sorted_by_area
    @reviews  = Review.all
    @photos   = Photo.all
    @offers   = Offer.all
  end
end
