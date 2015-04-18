class AboutController < ApplicationController
  def index
    @certificates  = Certificate.all
  end
end
