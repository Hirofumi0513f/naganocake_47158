class Public::ItemsController < ApplicationController
  def index
    # kaminariを用いてページネーションを実装。商品id順に1ページあたり8件表示されるようにする。
    @items = Item.order(:id).page(params[:page]).per(8)
  end

  def show
    @itemf =Item.find(params[:id])
  end

  # 以下ストロングパラメータ
  # 意図しないデータの登録・更新を防ぐ機能
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end
