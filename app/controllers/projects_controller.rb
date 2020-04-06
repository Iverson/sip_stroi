class ProjectsController < ApplicationController
  def index
    @all_projects = Project.published.sorted_by_area
    @special_projects = Project.special.published.sorted_by_area
  end

  def section
    @section = params["section"] || "typical"
    @scope   = params["scope"]
    @projects = @scope ? Project.send(@scope) : Project.where(section: @section).published.sorted_by_area
  end

  def show
    @project = Project.published.where(:uri => params[:id]).first
    if !@project
      redirect_to projects_path and return
    end

    @prev = Project.published.sorted_by_area.where("area < ?", @project.area).last
    @next = Project.published.sorted_by_area.where("area > ?", @project.area).first

    set_meta @project.meta.attributes if @project.meta
  end
end
