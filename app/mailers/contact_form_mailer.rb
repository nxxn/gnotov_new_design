class ContactFormMailer < ActionMailer::Base
  default from: "nikita@gnotov.com"
  default to: "nikita@gnotov.com"

  def new_contact_form_message(message)
    @message = message
    mail(:subject => "Contact form")
  end

  def auto_message_to_client(email, locale)
    @locale = locale
    if locale == "ru"
      @subject = "Мы получили Вашу заявку [gnotov.com]"
    elsif locale == "en"
      @subject = "We received your application [gnotov.com]"
    elsif locale == "lv"
      @subject = "We received your application [gnotov.com]"
    end
    mail(subject: @subject, to: email)
  end
end
