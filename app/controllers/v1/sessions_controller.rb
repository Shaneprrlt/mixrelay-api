class V1::SessionsController < ApplicationController

  before_action :authenticate_client, only: [:login]

  def login
    @user = User.where(username: params[:username]).or(User.where(email: params[:username])).first
    if @user.present? && @user.authenticate(params[:password])
      render 'v1/users/show', status: :ok
    else
      invalid_credentials
      return
    end
  end

  private

  def invalid_credentials
    render json: {
      errors: ['The information you provided is incorrect']
    }, status: :unauthorized
  end

end
