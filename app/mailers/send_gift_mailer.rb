class SendGiftMailer < ApplicationMailer
  def send_gift(email)
    @email = email
    mail(to: @email, subject: 'Hediyeniz var!')
  end
end
