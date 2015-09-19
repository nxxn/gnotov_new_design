class MessagesController < ApplicationController

  def send_new_contact_form_message
    @message = Message.new(contact_form_params)
    @message.status = "Sent"

    if @message.save
      ContactFormMailer.new_contact_form_message(@message).deliver_later
      #ContactFormMailer.auto_message_to_client(params[:email], I18n.locale.to_s).deliver_later
      render :js=>"$('.new_message')[0].reset();"
    end

  end

  private

    def contact_form_params
      params.permit(:email, :name, :message, :status, :trigger_button, :referrer)
    end

end
