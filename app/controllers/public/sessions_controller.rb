# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :reject_deleted_customer, only: [:create]

  # 顧客ログイン後の遷移先ページの指定
  def after_sign_in_path_for(resource)
    root_path
  end

  # 顧客ログアウト後の遷移先ページ指定
  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 会員情報の「論理削除」のための記述。退会後、同じアカウントで利用できないようにする
  # 論理削除：データ自体は残っているが、「削除」扱いにしていること。データ上からも完全に削除することを「物理削除」という。
   def reject_deleted_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        # 新規会員登録画面（new_customer_registration）へ遷移させる
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
   end
end