class ApplicationController < ActionController::API

  def authenticate
    if bearer_token.present?
      @current_user = User.where(token: bearer_token)
      if @current_user.present? && !@current_user.banned
        @current_user.resurrect_if_deactivated!
      else
        unauthorized_bearer
        return
      end
    else
      unauthorized_bearer
      return
    end
  end

  def authenticate_client
    if client_token.present?
      unless Client.where(token: client_token).exists?
        unauthorized_client
        return
      end
    else
      unauthorized_client
      return
    end
  end

  def current_user
    return @current_user ||= nil
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization'] # <= env
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def client_token
    pattern = /^Client /
    header  = request.headers['Authorization'] # <= env
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def unprocessable_record(record)
    render json: {
      errors: record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def unauthorized_client
    render json: {
      errors: ['Client must be authorized']
    }, status: :unauthorized
  end

  def unauthorized_bearer
    render json: {
      errors: ['User must be authorized']
    }, status: :unauthorized
  end

end
