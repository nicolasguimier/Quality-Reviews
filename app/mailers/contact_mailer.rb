class ContactMailer < ApplicationMailer
  def general_message(contact)
    @contact = contact
    mail(to: ENV["EMAIL_RECIPIENT"], subject: ENV["EMAIL_SUBJECT"])
  end
end
