class Public::ItemsController < ApplicationController
  def index
    # kaminariを用いてページネーションを実装。商品id順に1ページあたり8件表示されるようにする。
    @items = Item.order(:id).page(params[:page]).per(8)
  end

  def show
  end
end
