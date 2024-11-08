class CartProductsController < ApplicationController
  before_action :set_cart

  def create
    @product = Product.find(params[:product_id])
    @product_cart = @cart.product_carts.build(product: @product, added_at: Time.current)
    @product.product_carts << @product_cart
  
    if @product_cart.save
      redirect_to cart_path(@cart), notice: '商品已添加到购物车。'
    else
      redirect_to root_path, alert: '无法添加商品到购物车。'
    end
  end

  def index
    @product_carts = @cart.product_carts.includes(:product) # 包含产品信息
    @products = @product_carts.map(&:product).uniq # 从 product_carts 获取产品，并确保唯一性
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.build_cart
  end
end