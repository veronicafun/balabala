require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
<<<<<<< HEAD
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match user.name, mail.body.encoded 
    assert_matchuser.activation_token, mail.body.encoded 
    assert_match CGI.escape(user.email), mail.body.encoded
   end
 end
=======
    mail = UserMailer.account_activation
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
>>>>>>> account-activation

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
