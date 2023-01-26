class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detailsf = OrderDetails.find(params[:order_id])

    @total_amount = 0
  end

    private
  def order_details_params
    params.require(:order_details).permit(:order_id, :item_id, :amount, :making_status, :price)
  end
end
