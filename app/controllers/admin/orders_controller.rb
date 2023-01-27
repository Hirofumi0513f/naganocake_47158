class Admin::OrdersController < ApplicationController
  def show
    @orderf = Order.find(params[:id])
    @total_amount = 0

    # .page(params[:page]).per(10):ページネーションで１ページあたり10件表示させる
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def update
    @orderf = Order.find(params[:id])
     @total = 0
    if @orderf.update(order_params)
      flash[:notice] ="Order updated successfully."
      redirect_to admin_order_path(order.id)
    else
      reder :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :status, :price)
  end
end
