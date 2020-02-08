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
    mail(to: "nicolas.guimier@gmail.com", subject: "You Have a Message From Your Website")
  end
end
