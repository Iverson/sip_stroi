class ProjectsController < ApplicationController
  def index
    section = params["section"] || "typical"
    @projects = Project.where(section: section).published.sorted_by_area
  end

  def show
    @project = Project.published.where(:uri => params[:id]).first

    set_meta @project.meta.attributes if @project.meta
  end
end
