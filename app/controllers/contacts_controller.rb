class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(message_params)
    if @contact.valid?
      mailer3 = ActionMailer::Base.new
      mailer3.mail(from: 'sender@example.com', to: 'recipient@example.com', subject: 'test', body: "Hello, you've got mail!").deliver
      # raise
      # mail = ContactMailer.general_message(@contact)
      # raise
      # mail.deliver
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      flash[:notice] = "There was an error sending your message. Please try again."
    end
    redirect_to root_path
  end

  private

  def message_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
