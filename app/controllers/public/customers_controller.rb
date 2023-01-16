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

  # 退会確認用アクション
  def unsubscribe
    @customerf = current_customer
  end

  # 退会のアクション
  def withdrawal
    @customerf = current_customer
    # is_deletedカラムをtrueに変更して削除フラグを立てる
    @customerf.update(is_deleted: true)
    # reset_session：セッション情報を削除するコマンド
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path

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
