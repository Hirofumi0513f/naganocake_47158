class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @total_amount = 0
    if @order_detail.update(order_details_params)
      flash[:notice] ="Order_detail updated successfully."
      # order_detailに紐づくorder画面に遷移させる
      redirect_to admin_order_path(@order_detail.order)
    else
      render :show
    end
  end

    private
  # 更新を許可させる項目だけを記載すること。
  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end
end
