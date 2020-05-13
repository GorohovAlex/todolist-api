class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_access_request!

  def create
    result = Project::Operation::Create.call(params: project_params, current_user: current_user)

    if result.success?
      render json: serialize_model(result[:model])
    else
      render json: serialize_errors(result[:model].errors.messages), status: :unprocessable_entity
    end
  end

  def update
    result = Project::Operation::Update.call(params: params, current_user: current_user)

    if result.success?
      render json: serialize_model(result[:model])
    else
      render json: serialize_errors(result[:model].errors.messages), status: :unprocessable_entity
    end
  end

  def destroy
    result = Project::Operation::Delete.call(params: params, current_user: current_user)

    if result.success?
      render json: nil, status: 204
    else
      render json: serialize_errors(result[:model].errors.messages), status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name).merge(user_id: current_user.id)
  end
end
