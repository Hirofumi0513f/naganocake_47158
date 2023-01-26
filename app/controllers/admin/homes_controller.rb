class Admin::HomesController < ApplicationController
    # ↓管理者ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

  def top
    # .page(params[:page]).per(10):ページネーションで１ページあたり10件表示させる
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)

    @total_amount = 0
  end
end
