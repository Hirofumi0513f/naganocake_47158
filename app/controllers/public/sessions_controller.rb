# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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

   def reject_invalid_customer
    customer = Customer.find_by(email: params[:customer][:email])
    return unless customer

    return if customer.valid_password?(params[:customer][:password]) && customer.active_for_authentication?

    alert_message = if customer.status == 'withdrawn'
                     'You have already resigned'
                   else
                     'Your account is suspended'
                   end
    redirect_to request.referer, alert: alert_message
   end
end
