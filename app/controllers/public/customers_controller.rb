class Public::CustomersController < ApplicationController
  def show
    @customerf = current_customer
  end

  def edit
    @customerf = current_customer
  end

  def update
    @customerf = current_customer
    if @customerf.update!(customer_params)
      flash[:notice] = "Customer updated successfully."
      redirect_to public_customers_path(@customerf.id)
    else
      render :edit
    end
  end

  def unsubscribe
    # 退会確認用アクション
    @customerf = current_customer
  end

  def withdrawal
    
    
  end

    # 以下ストロングパラメータ
    # 意図しないデータの登録・更新を防ぐ機能
    private
      def customer_params
        params.require(:customer).permit(
          :last_name, :first_name, :last_name_kana, :first_name_kana,
          :postal_code, :address, :telephone_number, :email)
      end

end
