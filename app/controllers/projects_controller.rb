class ProjectsController < ApplicationController
  def index
    @typical_projects = Project.where(section: 'typical').published.sorted_by_area
    @individual_projects = Project.where(section: 'individual').published.sorted_by_area
    @special_projects = Project.special.published.sorted_by_area
  end

  def section
    @section = params["section"] || "typical"
    @scope   = params["scope"]
    @projects = @scope ? Project.send(@scope) : Project.where(section: @section).published.sorted_by_area
  end

  def show
    @project = Project.published.where(:uri => params[:id]).first

    set_meta @project.meta.attributes if @project.meta
  end
end
