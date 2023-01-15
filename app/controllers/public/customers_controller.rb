class Public::CustomersController < ApplicationController
  def show
    @cutomerf = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdrawal
  end

end
