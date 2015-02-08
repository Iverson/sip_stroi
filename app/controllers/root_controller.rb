class RootController < ApplicationController
  def index
    @projects = Project.sorted
    @reviews  = Review.all
    @photos   = Photo.all
    @offers   = Offer.all
  end
end
