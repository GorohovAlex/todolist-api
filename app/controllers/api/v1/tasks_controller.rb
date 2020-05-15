class Api::V1::TasksController < ApplicationController
  before_action :authorize_access_request!

  def index
    result = Task::Operation::Index.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_models(result[:model]), status: :ok
    else
      render json: serialize_errors(result[:errors].errors.messages), status: :unprocessable_entity
    end
  end

  def create
    result = Task::Operation::Create.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_model(result[:model]), status: :created
    else
      render json: serialize_errors(result['result.contract.default'].errors.messages), status: :unprocessable_entity
    end
  end

  def show
    result = Task::Operation::Show.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_model(result[:model]), status: :ok
    else
      render json: serialize_errors(result['errors'].errors.messages), status: :unprocessable_entity
    end
  end

  def update
    result = Task::Operation::Update.call(params: params, current_user: current_user)
    if result.success?
      render json: serialize_model(result[:model]), status: :ok
    else
      render json: serialize_errors(result['result.contract.default'].errors.messages), status: :unprocessable_entity
    end
  end

  def destroy
    Task::Operation::Delete.call(params: params, current_user: current_user)
    render json: nil, status: :no_content
  end
end
