module ApplicationExceptions
  extend ActiveSupport::Concern

  included do
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_found  
  end

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def not_found(errors)
    render json: serialize_errors(errors), status: :not_found
  end
end
