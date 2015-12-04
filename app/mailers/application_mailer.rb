class ApplicationMailer < ActionMailer::Base
  default from: "test@ticketly.com"
  layout 'mailer'
end
