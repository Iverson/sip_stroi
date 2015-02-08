class PanelsController < ApplicationController
  def index
    @panels = Panel.all
  end
end
