class Api::V1::AuthController < ApplicationController
  # before_action :authorize_access_request!

  def sign_up
    user = User.new(user_params)

    if user.save
      render json: serialize_model(user)
    else
      render json: serialize_errors(user.errors), status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
