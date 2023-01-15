class Admin::CustomersController < ApplicationController
  # ↓管理者ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @customers = Customer.order(:id).page(params[:page]).per(10)
  end

  def show
    @customerf = Customer.find(params[:id])
  end

  def edit
    @customerf = Customer.find(params[:id])
  end

  def update
    @customerf = Customer.find(params[:id])
    if @customerf.update(customer_params)
      flash[:notice] = "Customer updated successfully."
      redirect_to admin_customer_path(@customerf.id)
    else
      render :edit
    end
  end

    # 以下ストロングパラメータ
    # 意図しないデータの登録・更新を防ぐ機能
    private
      def customer_params
        params.require(:customer).permit(
          :last_name, :first_name, :last_name_kana, :first_name_kanam,
          :postal_code, :address, :telephone_number, :email,
          :is_deleted)
      end
end
