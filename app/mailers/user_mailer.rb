class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
<<<<<<< HEAD
    @user=user
    mail to:user.mailer, subject:"Account activation"
=======
    @user = user
    mail to: user.email, subject: "Account activation"
>>>>>>> account-activation
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
<<<<<<< HEAD

=======
>>>>>>> account-activation
end
