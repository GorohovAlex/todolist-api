class Api::V1::UsersController < ApplicationController
  before_action :authorize_access_request!, only: [:sign_in]

  def create
    result = User::Operation::Create.call(params: user_params, current_user: nil)
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
