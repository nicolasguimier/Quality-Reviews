# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact
  def general_message
    contact = Contact.new(name: "Nico",email: "nico@mail.com", phone: "65465", message: "CEci est un message" )
    ContactMailer.with(contact: @contact).general_message(contact)
  end

end
