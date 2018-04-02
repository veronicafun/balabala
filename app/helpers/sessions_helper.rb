module SessionsHelper
    def log_in(user)
        session[:user_id]=user.id
    end
    # 想在不同地方使用这个登录方法，所以在这个辅助模块中定义一个名为log_in
    def remember(user)
        # user.remember
        cookies.permanent.signed[:user_id]=user.id
        cookies.permanent[:remember_token]=user.remember_token
    end

    def current_user
        if (user_id = session[:user_id]) 
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user 
        end
     end
    end
    # 返回当前用户，如果有的话

    def logged_in?
        !current_user.nil?
    end
    # 这里logged_in？是使用if-else语句，返回布尔值
    # 登录显示一组链接，未登录显示另一
    # !current_user.nil?意思是current_user不是nil
    # 登录返回true,否则返回false

    def forget(user)
        # user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
    end

    

    
end
