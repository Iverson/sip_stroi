class ProjectsOrdersController < ApplicationController
  def create
    params = projects_order_params
    items_ids  = params["project"]["items"]
    project_id = params["project"]["id"]
    params.delete("project")

    @projects_order = ProjectsOrder.new(params)
    @projects_order.add_project_params(project_id)
    @projects_order.add_items(items_ids)

    respond_to do |format|
      if @projects_order.save
        format.json { render json: {success: "Created"} }
      else
        format.json { render json: {error: "Bad request"} }
      end
    end
  end

  def projects_order_params
    params.require(:projects_order).permit(:message, project: [:id, items: []], user_info_attributes: [:name, :phone])
  end
end
