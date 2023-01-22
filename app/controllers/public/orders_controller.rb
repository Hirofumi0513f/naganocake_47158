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
      redirect_to public_confirm_path
      # ユーザに関連するカートのデータ（購入データ）を全て削除（カートを空にする）
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render:new
    end
  end

  #注文確認画面のアクション
  def confirm
    @order = Oreder.new(order_params)
    if params[:order][:address_number] == "1"
    # view で定義している address_number が"1"だったときにこの処理を実行します
    # form_with で @order で送っているので、order に紐付いた address_number となります
      @order.name = current_customer.name
      @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
    # view で定義している address_number が"2"だったときにこの処理を実行します
      if Address.exists?(name: params[:order][:registered])
      # registered は view で定義しています
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        # 万が一データが足りない場合は new を render します
        render :new
      end
    # view で定義している address_number が"3"だったときにこの処理を実行します
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
        if address_new.save
        else
          # データはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
          render :new
        end
    else
      # 万が一当てはまらないデータが渡ってきた場合の処理。カートアイテムのindexページに遷移させる
      redirect_to public_cart_items_path
    end
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
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
