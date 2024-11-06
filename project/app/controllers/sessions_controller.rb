class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role.name == 'admin'
        redirect_to root_path, notice: '管理员登录成功！'
      else
        redirect_to root_path, notice: '登录成功！'
      end
    else
      flash.now[:alert] = '邮箱或密码无效。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: '已登出。'
  end
end
