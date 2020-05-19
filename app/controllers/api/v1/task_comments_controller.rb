class Api::V1::TaskCommentsController < ApplicationController
  before_action :authorize_access_request!

  def index
    result = TaskComment::Operation::Index.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_models(result[:model]), status: :ok
    else
      render json: serialize_errors(result[:errors]), status: :unprocessable_entity
    end
  end

  def create
    result = TaskComment::Operation::Create.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_model(result[:model]), status: :created
    else
      render json: serialize_errors(result['result.contract.default'].errors.messages), status: :unprocessable_entity
    end
  end

  def destroy
    TaskComment::Operation::Delete.call(params: params, current_user: current_user)
    render json: nil, status: :no_content
  end
end
