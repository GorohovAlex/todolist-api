class Api::V1::UsersController < ApplicationController
  before_action :authorize_access_request!, only: [:sign_in]

  def create
    user = User.new(user_params)

    if user.save
      render json: serialize_model(user)
    else
      render json: serialize_errors(user.errors), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
