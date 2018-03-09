class V1::UsersController < ApplicationController

  before_action :authenticate_client, only: [:create]
  before_action :authenticate, only: [:me, :update, :destroy]

  def me
    @user = @current_user
    render 'v1/users/show', status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'v1/users/show', status: :ok
    else
      unprocessable_record(@user)
    end
  end

  def update
    @user = @current_user
    if @user.update(user_params)
      render 'v1/users/show', status: :ok
    else
      unprocessable_record(@user)
    end
  end

  def destroy
    @user = @current_user
    if @user.update(status: :deactivated)
      render json: {}, status: :no_content
    else
      unprocessable_record(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :phone_number, :phone_verified)
  end

end
