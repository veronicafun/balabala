class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user,   only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # param去获取用户ID，params[:id]返回ID,即1
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     # 创建用户，param获取user
    if @user.save
      # 注册成功
      UserMailer.account_activation(@user).deliver_now
      log_in @user
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
      # 注册失败那就是已经存在用户，去到new那里登录
    end
  end
  
    def edit
      @user=User.find(params[:id])
    end
    # 编辑用户

    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 处理更新成功的情况
      flash[:success] = "Profile updated"
      redirect_to @user
      else
        render 'edit'
      end
    end 

    def following 
      @title = "Following" 
      @user = User.find(params[:id]) 
      @users = @user.following.paginate(page: params[:page]) 
      render 'show_follow' 
    end 
    
    def followers 
      @title = "Followers" 
      @user = User.find(params[:id]) 
      @users = @user.followers.paginate(page: params[:page]) 
      render 'show_follow' 
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger]="Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end