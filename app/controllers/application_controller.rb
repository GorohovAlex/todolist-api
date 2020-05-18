class ApplicationController < ActionController::API
  include Trailblazer::Rails::Controller
  include JWTSessions::RailsAuthorization

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def serialize_model(model, options = {})
    options[:is_collection] = false
    JSONAPI::Serializer.serialize(model, options)
  end

  def serialize_models(models, options = {})
    options[:is_collection] = true
    JSONAPI::Serializer.serialize(models, options)
  end

  def serialize_errors(errors)
    JSONAPI::Serializer.serialize_errors(errors)
  end

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def not_found(errors)
    render json: serialize_errors(errors), status: :not_found
  end
end
