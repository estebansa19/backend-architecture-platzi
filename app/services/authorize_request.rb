require 'json_web_token'

class AuthorizeRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    authorize_request
  end

  private

  attr_reader :headers

  def authorize_request
    return unless header_token

    get_user
  end

  def header_token
    @header_token ||= headers['Authorization']
  end

  def user_id 
    JsonWebToken.decode(header_token)['user_id']
  end

  def get_user
    User.find_by(id: user_id)
  end
end
