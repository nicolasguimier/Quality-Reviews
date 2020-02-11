class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(message_params)
    if @contact.valid?
      mail = ContactMailer.general_message(@contact)
      mail.deliver_now
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      flash[:alert] = "There was an error sending your message. Please try again."
    end
    redirect_to root_path
  end

  private

  def message_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
