class SendAuthyVerificationCodeJob < ApplicationJob
  queue_as :default

  def perform(phone_number)
    response = Authy::PhoneVerification.start(via: 'sms', country_code: 1, phone_number: phone_number)
    if response.ok?
    end
  end
end
