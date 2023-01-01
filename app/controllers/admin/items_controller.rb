class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page]).per(1)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
