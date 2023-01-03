class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.order(:id).page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
end
