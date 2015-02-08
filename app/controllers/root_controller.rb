class RootController < ApplicationController
  def index
    @projects = Project.all
    @reviews  = Review.all
    @photos   = Photo.all
  end
end
