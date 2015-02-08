class ProjectsController < ApplicationController
  def index
    @projects = Project.sorted
  end

  def show
    @project = Project.find(params[:id])
  end
end
