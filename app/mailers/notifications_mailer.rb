class NotificationsMailer < ApplicationMailer
  def contact(email_params, order)
   @message = "Thank you for your recent order with Ticketly!"
   @order = order

   mail(
         to: email_params,
         subject: "Recent Order from Ticketly"
       )
  end
end
