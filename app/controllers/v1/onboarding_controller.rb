class V1::OnboardingController < ApplicationController

  def check_username
    username_available = false
    unless params[:username].nil? || params[:username].blank?
      username_available = User.where(username: params[:username]).empty?
    end

    render json: {
      username_available: username_available
    }, status: :ok
  end

end
