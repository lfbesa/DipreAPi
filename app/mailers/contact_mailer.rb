class ContactMailer < ApplicationMailer
  default from: 'notifications@dipre.com'

  def contact_email
    @contact = params[:values]
    console.log(22)
    mail(to:'lfbesa@uc.cl', subject: @contact.subject)
    console.log(33)
  end
end
