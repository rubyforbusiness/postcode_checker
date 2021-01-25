# frozen_string_literal: true

# Rails Mailer Class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
