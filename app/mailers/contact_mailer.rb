class ContactMailer < ApplicationMailer
  default from: 'notifications@dipre.com'

  def contact_email
    @contact = params[:values]
    @url  = 'http://example.com/login'
    mail(to:'lfbesa@uc.cl', subject: @contact.subject)
  end
end
