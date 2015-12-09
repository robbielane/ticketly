class ApplicationMailer < ActionMailer::Base
  default from: "orders@ticketly.com"
  layout 'mailer'
end
