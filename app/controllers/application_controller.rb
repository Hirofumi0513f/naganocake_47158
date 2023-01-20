class ApplicationController < ActionController::Base
  # CSRF対策（クロスサイトリクエストフォージェリ）のための記述
  protect_form_forgery with: :exception

  before_action :configure_permitted_parameters,if: :devise_controller?

# customerがログインしている場合、紐づいたcart_itemを参照させる記述？
helper_method :current_cart_item

def current_cart_item
  if current_customer
    # customerとcart_itemの紐付け
    current_cart_item = current_customer.cart_item || current_customer.create_cart_item!
  else
    # sessionとcart_itemの紐付け
    current_cart_item = CartItem.find_by(id: session[:cart_id]) || CartItem.create_cart_item
    session[:cart_id] ||= current_cart_item.id
  end
  current_cart_item
end

  private
  # devise版ストロングパラメータ
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address,
       :telephone_number, :password])
    end

end
