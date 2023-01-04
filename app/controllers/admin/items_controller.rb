class Admin::ItemsController < ApplicationController
  # ↓ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    # kaminariを用いてページネーションを実装。商品id順に1ページあたり10件表示されるようにする。
    @items = Item.order(:id).page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.genre.id = genre.id
    @item.save
    redirect_to admin_items_path
  end

  def show
    @itemf = Item.find(params[:id])
    @genre = @item.genres
    @item = Item.new

  end

  def edit
    @itemf = Item.find(params[:id])
  end

  def update
  end

  # 以下ストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:item_photo, :name, :introduction, :genre_id, :price, :is_active)
  end
end
