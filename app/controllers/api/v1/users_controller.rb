class Api::V1::UsersController < ApplicationController
  before_action :authorize_access_request!, only: [:sign_in]

  def create
    result = Users::Operation::Create.call(user_params)

    if result
      render json: serialize_model(result[:model])
    else
      render json: serialize_errors(result[:errors]), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
