class ProjectsController < ApplicationController
  def index
    @projects = Project.published.sorted_by_area
  end

  def show
    @project = Project.published.where(:uri => params[:id]).first
  end
end
