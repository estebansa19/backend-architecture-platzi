require 'json_web_token'

class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    get_user_token
  end

  private

  attr_reader :email, :password

  def get_user_token
    if user && user.authenticate(password)
      JsonWebToken.encode(user_id: user.id)
    end
  end

  def user
    @user ||= User.find_by_email(email)
  end
end
