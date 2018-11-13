class ContactMailer < ApplicationMailer
  default from: 'lfbesa@uc.cl'

  def contact_email
    @contact = params[:values]
    puts 1
    mail(to:'lfbesa@uc.cl', subject: @contact.subject)
    puts 2
  end
end
