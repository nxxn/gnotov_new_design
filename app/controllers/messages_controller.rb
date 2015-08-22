class MessagesController < ApplicationController

  def send_new_contact_form_message
    @message = Message.new(contact_form_params)
    @message.status = "Sent"

    ap @message

    if @message.save
      ap "wrewr"
      ContactFormMailer.new_contact_form_message(@message).deliver_later
      render :nothing => true, :status => 200, :content_type => 'text/html'
    end

  end

  private

    def contact_form_params
      params.permit(:email, :name, :message, :status, :trigger_button, :referrer)
    end

end
