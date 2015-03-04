class ProjectsController < ApplicationController
  def index
    @projects = Project.sorted_by_area
  end

  def show
    @project = Project.find(params[:id])
  end
end
