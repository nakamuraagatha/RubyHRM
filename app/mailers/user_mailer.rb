class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #

  default from: "admin@RubyHRM.com"

  def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "Password Reset"
  end
end
