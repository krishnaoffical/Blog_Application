class SendSignupEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.signup_confirmation(user).deliver_now
  end
end
