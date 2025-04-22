class ApplicationController < ActionController::API
  allow_browser versions: :modern
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header&.split(" ")&.last
    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def current_user
    @current_user
  end
end
