class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @orders = current_customer.orders
    @order = @orders.new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

end
