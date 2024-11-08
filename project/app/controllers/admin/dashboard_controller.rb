module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_admin!

    def index
      @products = Product.all
      @orders = Order.all
      @users = User.all
    end
  end
end