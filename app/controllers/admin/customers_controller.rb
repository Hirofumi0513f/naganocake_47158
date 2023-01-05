class Admin::CustomersController < ApplicationController
  # ↓管理者ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

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
