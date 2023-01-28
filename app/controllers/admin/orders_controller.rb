class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0

    # .page(params[:page]).per(10):ページネーションで１ページあたり10件表示させる
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def update
    @order = Order.find(params[:id])
     @total = 0
    if @order.update(order_params)
      flash[:notice] ="Order updated successfully."
      redirect_to admin_order_path(@order)
    else
      reder :show
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders

    @total_amount = 0
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :status, :price)
  end
end
