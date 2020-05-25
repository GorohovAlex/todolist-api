class ApplicationController < ActionController::API
  include ApplicationExceptions
  include Trailblazer::Rails::Controller
  include JWTSessions::RailsAuthorization

  private

  def current_user
    @current_user ||= User.find_by!(id: payload['user_id'])
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
end
