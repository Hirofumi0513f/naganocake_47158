class Public::HomesController < ApplicationController
  def top
    # 全てのitem（商品)をcrete_at属性（データ制作日時）でdesc（降順)で持ってくるインスタンス変数
    # モデル名.limit(取得したい件数)→取得したいレコード数を指定する際に使用するメソッド
    @items = Item.all.order(created_at: :desc).limit(4)
  end

  def about
  end

  # 以下ストロングパラメータ
  # 意図しないデータの登録・更新を防ぐ機能
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end
