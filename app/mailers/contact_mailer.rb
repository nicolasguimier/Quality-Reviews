# class ContactMailer < ApplicationMailer
#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.contact_mailer.contact.subject
#   #
#   def general_message(contact)
#     @contact = contact
#   #def contact
#     # @message = params[:message]
#     @content = "Contenu !"
#     mail(to: "nicolas.guimier@gmail.com", subject: 'New contact from the platform')
#   end
# end

class ContactMailer < ApplicationMailer
  def general_message(contact)
    @contact = contact
    mail(to: ENV["EMAIL_RECIPIENT"], subject: ENV["EMAIL_SUBJECT"])
  end
end
