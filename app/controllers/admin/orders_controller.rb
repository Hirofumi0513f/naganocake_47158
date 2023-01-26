class Admin::OrdersController < ApplicationController
  def show
    @orderf = Order.find(params[:id])
    @total_amount = 0
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :status, :price)
  end
end
