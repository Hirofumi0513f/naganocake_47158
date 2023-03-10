class Admin::ItemsController < ApplicationController
  # ↓管理者ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

    def index
      # kaminariを用いてページネーションを実装。商品id順に1ページあたり10件表示されるようにする。
      @items = Item.order(:id).page(params[:page]).per(10)
      @item = Item.new
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "Item was successfully created."
        redirect_to admin_item_path(@item.id)
      else
        render :new
      end
    end

    def show
      @itemf = Item.find(params[:id])
      @item = Item.new
    end

    def edit
      @itemf = Item.find(params[:id])
    end

    def update
      @itemf = Item.find(params[:id])
      if @itemf.update(item_params)
        flash[:notice] = "Item updated succssfully."
        redirect_to admin_item_path(@itemf.id)
      else
        render :edit
      end
    end

    # 以下ストロングパラメータ
    # 意図しないデータの登録・更新を防ぐ機能
    private
      def item_params
        params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
      end
end
