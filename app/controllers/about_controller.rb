class AboutController < ApplicationController
  def index
    @reviews  = Review.all
  end
end