class NotificationsMailer < ApplicationMailer
  def contact(email_params)
   @message = "Thanks for your recent order with Ticketly!" 

   mail(
     to: email_params,
     subject: "Message from Ticketly"
   )
  end
end
