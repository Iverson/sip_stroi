class PanelsOrdersController < ApplicationController
  def create
    params = panels_order_params
    panels_params = params["panels"]
    params.delete("panels")

    @panels_order = PanelsOrder.new(params)
    @panels_order.add_panels(panels_params)

    respond_to do |format|
      if @panels_order.save
        format.json { render json: {success: "Created"} }
      else
        format.json { render json: {error: "Bad request"} }
      end
    end
  end

  def panels_order_params
    params.require(:panels_order).permit(:message, panels: [:id, :count, :size, :price, :material], user_info_attributes: [:name, :phone])
  end
end
