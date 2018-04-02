require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # 这是编写测试文件
  def setup
     @user=users(:michael)
  end

  test "login with valid information followed by logout" do
    get login_path
    # 步骤1 访问登录页面
    post login_path, params:{session:{email:   @user.email,password:'password'}}
    # 步骤3 提交无效的params散列，向登录路径发起post请求
    assert is_logged_in?
    assert_redirect_to @user
    follow_redirect!
    assert_template 'users/show'
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)
        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to root_url
        delete logout_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user), count: 0

  end
end
