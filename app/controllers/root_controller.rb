class RootController < ApplicationController
  def index
    @projects = Project.published.positioned
    @reviews  = Review.all
    @photos   = Photo.all
    @offers   = Offer.all
  end
end
