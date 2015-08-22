class ContactFormMailer < ActionMailer::Base
  default :from => "nikita@gnotov.com"
  default :to => "nikita@gnotov.com"

  def new_contact_form_message(message)
    @message = message
    mail(:subject => "Contact form")
  end
end
