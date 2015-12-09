class NotificationsMailer < ApplicationMailer
  def contact(email_params, order)
   @message = "Thanks for your recent order with Ticketly!"
   @order = order

   mail(
         to: email_params,
         subject: "Message from Ticketly"
       )
  end
end
