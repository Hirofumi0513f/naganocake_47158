class Admin::GenresController < ApplicationController
  def index
    @generes = Genre.all
    @genre = Genre.new
    # @genere = Genre.find(params[:id])←paramsが違う。2023/1/9
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  # 商品画面に画像を追加する機能を追加するために記載。2023/1/1
  def genres_params
    params.require(:admin).permit(:image)
  end
end
