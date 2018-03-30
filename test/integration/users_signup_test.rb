require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
test "valid signup information" do
  get signup_path
  assert_no_difference 'User.count', 1  do
    post users_path, params: {user:
                            {name:"Example User",email:"user@invalid",password:"pass",
                            password_confirmation:"pass"}}
end
follow_redirect!
assert_template 'users/show'
end
end

