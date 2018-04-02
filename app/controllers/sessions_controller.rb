class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user &&  user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面,如果验证失败，authenticate返回false
      # 这一句是一个逻辑语句
      # user和后面都返回true，整句才返回true
      log_in user
      params[:session][:remember_me] == '1'? remember(user):forget(user)
      # if params[..]...  remember(user) else forget..
      # 等于1就是选了复选框，没有就=0
      redirect_to user
    else
      # 创建一个错误信息
      flash.now[:danger] = 'Invalid email/password combination'
      # 错误信息闪现渲染,flash.now用于在重新渲染的页面中显示闪现消息
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
