class V1::PhoneVerificationController < ApplicationController

  before_action :authenticate_client, only: [:send_verification_code, :verify_code]

  def send_verification_code
    SendAuthyVerificationCodeJob.perform_later(params[:phone_number])
    render json: {}, status: :ok
  end

  def verify_code
    response = Authy::PhoneVerification.check(verification_code: params[:code], country_code: 1, phone_number: params[:phone_number])
    if response.ok?
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

end
