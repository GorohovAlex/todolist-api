class Api::V1::UsersController < ApplicationController
  def create
    result = User::Operation::Create.call(params: params, current_user: nil)

    if result.success?
      render json: serialize_model(result[:model]), status: :created
    else
      render json: serialize_errors(result['result.contract.default'].errors.messages), status: :unprocessable_entity
    end
  end
end
