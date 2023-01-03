class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    # kaminariを用いてページネーションを実装。商品id順に1ページあたり10件表示されるようにする。
    @items = Item.order(:id).page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.genre.id = genre.id
    @item.save
    redirect_to admin_items_path
  end

  def show

  end

  def edit
  end

  def update
  end
end
