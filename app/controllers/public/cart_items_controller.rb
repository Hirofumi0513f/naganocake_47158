class Public::CartItemsController < ApplicationController
  def index
    @cart_itemf = Cart_item.find(params[:id])
  end

  def update
    @cart_itemf = Cart_item.find(params[:id])
    @customer = current_customer(@customer)
    if @itemf.update(cart_item_params)
      flash[:notice] ="Cart_item updated successfully."
      redirect_to public_cart_items_path
    else
      reder :index
    end
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @customer = current_customer
    if @cart_item.save
      flash[:notice] ="Cart_item was successfully created."
      redirect_to public_cart_items_path(@customer)
    else
      redirect_to root_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
