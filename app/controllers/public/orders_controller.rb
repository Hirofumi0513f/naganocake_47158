class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    # ログインしているユーザに紐づく、カートアイテムに入れる
    cart_items = current_customer.cart_items
    # ログインしているユーザのオーダー作成
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.order_price = cart.item.price
        order_item.save
      end
      redirect_to public_confilm_path
      # ユーザに関連するカートのデータ（購入データ）を全て削除（カートを空にする）
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render:new
    end
  end

  #注文確認画面のアクション
  def confirm
  end

  # 注文完了画面のアクション
  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :price)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
