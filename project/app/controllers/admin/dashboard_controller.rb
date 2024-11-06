module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_admin!

    def index
      # 管理员面板的逻辑
    end
  end
end