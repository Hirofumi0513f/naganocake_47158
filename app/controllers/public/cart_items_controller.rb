class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # カートアイテムに入っている全ての商品を表示させる。ログインしているユーザの分だけ表示させる。
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_items = current_customer.cart_items
    @cart_item = @cart_items.new(cart_item_params)
    # 同一商品がカート内に存在する場合、カート内個数分を追加する
    # 元々カート内にあるもの「item_id」/今追加したものparams[:cart_item][:item_id]
    if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      # cart_item.amountに今追加したparams[:cart_item][:amount]を加える。/.to_iで数字として扱う
      cart_item.amount += params[:cart_item][:amount].to_i

      cart_item.save
      flash[:notice] ="Cart_item was successfully created."
      redirect_to public_cart_items_path

    # もしカート内に「同じ」商品がない場合は通常の保存処理をする
    elsif @cart_item.save
      redirect_to public_cart_items_path
    else
      redirect_to root_path
    end
  end

  def update
    @cart_itemf = CartItem.find(params[:id])
    # @cart_itemf.customer_id = current_customer.id
    if @cart_itemf.update(cart_item_params)
      flash[:notice] ="Cart_item updated successfully."
      redirect_to public_cart_items_path
    else
      reder :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path, notice: '該当商品をカートから削除しました。'
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to public_cart_items_path, notice: 'カートが空になりました。'
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
