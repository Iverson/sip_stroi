class RootController < ApplicationController
  def index
  	@projects = Project.all
  end
end
