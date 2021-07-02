class SendEmailJob < ApplicationJob
  def perform method, resume
    UserApplyMailer.send(method, resume).deliver_now
  end
end
