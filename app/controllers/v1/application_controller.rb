module V1
  class ApplicationController < ActionController::API
    include Rescueable
    attr_reader :current_user
    before_action :authenticate_request
  
    private
  
    def authenticate_request
      @current_user = AuthorizeRequest.new(request.headers).call
  
      render json: { error: 'Not authorized' }, status: :unauthorized unless @current_user
    end
  end
end
