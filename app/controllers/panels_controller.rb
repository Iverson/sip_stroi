class PanelsController < ApplicationController
  def index
    @panels = Panel.published
  end
end
