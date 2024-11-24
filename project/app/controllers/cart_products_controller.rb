class CartProductsController < ApplicationController
  before_action :set_cart

  def create
    @product = Product.find(params[:product_id])
    @product_cart = @cart.product_carts.build(product: @product, added_at: Time.current)
    @product.product_carts << @product_cart
    if @product_cart.save
      redirect_to cart_products_path, notice: "商品已添加到购物车。"
    else
      redirect_to root_path, alert: "无法添加商品到购物车。"
    end
  end

  def index
    puts "购物车商品列表"
    @product_carts = @cart.product_carts.includes(:product) # 包含产品信息
    @products = @product_carts.map(&:product).uniq # 从 product_carts 获取产品，并确保唯一性
  end

  def destroy
    @product_cart = @cart.product_carts.find_by(product_id: params[:id])
    if @product_cart
      @product_cart.destroy
      puts "删除购物车商品"
      redirect_to cart_products_path, notice: "商品已从购物车移除。"
    else
      redirect_to cart_products_path, alert: "未找到该商品。"
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.build_cart
  end
end
