module Rescueable
  extend ActiveSupport::Concern

  included do
    rescue_from JWT::VerificationError, with: :invalid_token
    rescue_from JWT::ExpiredSignature, with: :expired_token
  end

  private

  def invalid_token
    render json: { error: 'Not authorized'}, status: :unauthorized
  end

  def expired_token
    render json: { error: 'Token expired' }, status: :unauthorized
  end
end
