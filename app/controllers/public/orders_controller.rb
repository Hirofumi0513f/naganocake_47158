class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  #注文確認画面のアクション
  def confirm
    @order = Order.new(order_params)
    # view で定義している address_number が"0"だったときにこの処理を実行します
    # form_with で @order で送っているので、order に紐付いた address_number となる
    if params[:order][:address_number] == "0"
      # ログインユーザーのフルネームを取得
      @order.name = current_customer.full_name
      # ログインユーザーの住所を定義
      @order.address = current_customer.addresses_display
    # view で定義している address_number が"1"だったときにこの処理を実行します
    elsif params[:order][:address_number] == "1"
      # Address.exists？：住所が存在しているか？/params[モデル名][カラム名]
      # Address.exists?(id: params[:order][:registered])
      # registered は view で定義しています
        @order.postal_code = Address.find(params[:order][:registered]).postal_code
        @order.address = Address.find(params[:order][:registered]).address
        @order.name = Address.find(params[:order][:registered]).name
    # view で定義している address_number が"2"だったときにこの処理を実行します
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new
      address_new.postal_code = params[:order][:postal_code]
      address_new.address = params[:order][:address]
      address_new.name = params[:order][:address_name]
        if address_new.save
          @order.postal_code = address_new.postal_code
          @order.address = address_new.address
          @order.name = address_new.name
        else
          # データはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
          render :new
        end
    else
      # 万が一当てはまらないデータが渡ってきた場合の処理。カートアイテムのindexページに遷移させる
      redirect_to public_cart_items_path
    end
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.sum_of_price }
    # @order_postageで送料の代金を代入
    @order_postage = 800

    # 請求金額の定義
    @payment_price = @total + @order_postage
  end

  def create
    # ログインしているユーザに紐づく、カートアイテムに入れる
    cart_items = current_customer.cart_items
    # ログインしているユーザのオーダー作成
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderDetail.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.price = cart_item.item.price
        order_item.amount =cart_item.amount
        order_item.making_status = "cannot_start"
        order_item.save
      end
      redirect_to public_complete_path(@order.id)
      # ユーザに関連するカートのデータ（購入データ）を全て削除（カートを空にする）
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render:new
    end
  end

  # 注文完了画面のアクション
  def complete
  end

  # 注文履歴画面
  def index
    @orders = current_customer.orders
  end

  # 注文履歴詳細画面
  def show
    # @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code, :address, :name, :postage, :payment_method, :status, :price)
  end

  # def address_params
  #   params.require(:order).permit(:name, :address)
  # end
end
