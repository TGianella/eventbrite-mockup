class UserMailer < ApplicationMailer
  default from: 'theo.gianella@proton.me'

  def welcome_email(user)
    @user = user
    @url = 'http://eventbrite-clone-82010.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
