class RootController < ApplicationController
  def index
  	@projects = Project.all
  	@reviews  = Review.all
  end
end
