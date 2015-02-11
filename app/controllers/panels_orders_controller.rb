class PanelsOrdersController < ApplicationController
  def create
    @panels_order = PanelsOrder.new(panels_order_params)

    respond_to do |format|
      if @panels_order.save
        format.json { render json: {success: "Created"} }
      else
        format.json { render json: {error: "Bad request"} }
      end
    end
  end

  def panels_order_params
    params.require(:panels_order).permit(:message, items_attributes: [:size, :material, :count, :price], user_info_attributes: [:name, :phone])
  end
end
