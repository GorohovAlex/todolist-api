class Api::V1::SessionController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    result = Session::Operation::Create.call(params: params)

    if result.success?
      render json: result[:session]
    else
      render json: serialize_errors(result[:errors]), status: :unauthorized
    end
  end

  def destroy
    result = Session::Operation::Delete.call(params: params, payload: payload)
    render json: nil, status: 204
  end
end
