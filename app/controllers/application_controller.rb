class ApplicationController < ActionController::API
  include Pundit::Authorization
  allow_browser versions: :modern
  before_action :authorize_request
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header&.split(" ")&.last
    unless token
      render json: { error: "Unauthorized: No token provided" }, status: :unauthorized
      return
    end
    begin
      decoded = JsonWebToken.decode(token)
      if decoded && decoded[:user_id]
        @current_user = User.find(decoded[:user_id])
      else
        raise JWT::DecodeError, "Invalid token payload"
      end

    rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
      if e.is_a?(JWT::DecodeError)
        render json: { error: "Unauthorized: #{e.message}" }, status: :unauthorized
      else
        render json: { error: "Unauthorized: User not found for token" }, status: :unauthorized
      end
    end
  end

  def current_user
    @current_user
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    message = t "#{policy_name}.#{exception.query}", scope: "pundit", default: "Access denied: You are not authorized to perform this action."
    render json: { error: message }, status: :forbidden
  end
end
