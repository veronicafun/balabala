class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # param去获取用户ID，params[:id]返回ID,即1
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     # 创建用户，param获取user
    if @user.save
      # 注册成功
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      # 注册成功的闪现消息
      redirect_to @user
    else
      render 'new'
      # 注册失败那就是已经存在用户，去到new那里登录
  end
end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end