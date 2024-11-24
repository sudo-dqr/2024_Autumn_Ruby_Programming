class FavoriteProductsController < ApplicationController
  before_action :set_favorite

  def create
    @product = Product.find(params[:product_id])
    @product_favorite = @favorite.product_favorites.build(product: @product, added_at: Time.current)
    @product.product_favorites << @product_favorite
    if @product_favorite.save
      redirect_to favorite_products_path, notice: "商品已添加到收藏夹"
    else
      redirect_to root_path, alert: "无法添加商品到收藏夹"
    end
  end

  def index
    puts "收藏夹商品列表"
    @product_favorites = @favorite.product_favorites.includes(:product)
    @products = @product_favorites.map(&:product).uniq
  end

  def destroy
    @product_favorite = @favorite.product_favorites.find_by(product_id: params[:id])
    if @product_favorite
      @product_favorite.destroy
      puts "删除收藏夹商品"
      redirect_to favorite_products_path, notice: "商品已从收藏夹移除"
    else
      redirect_to favorite_products_path, alert: "未找到该商品"
    end
  end

  private
  def set_favorite
    @favorite = current_user.favorite || current_user.build_favorite
  end

end
