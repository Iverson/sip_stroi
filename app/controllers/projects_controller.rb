class ProjectsController < ApplicationController
  def index
    @projects = Project.published.sorted_by_area
  end

  def show
    @project = Project.published.where(:uri => params[:id]).first

    set_meta @project.meta.attributes if @project.meta
  end
end
