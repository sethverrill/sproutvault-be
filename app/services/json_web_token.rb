require "jwt"

class JsonWebToken
  ALGORITHM = "ES256".freeze

  def self.private_key
    OpenSSL::PKey::EC.new(Rails.application.credentials.jwt_private_key)
  end

  def self.public_key
    OpenSSL::PKey::EC.new(Rails.application.credentials.jwt_public_key)
  end

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = epx.to_i
    JWT.encode(payload, private_key, ALGORITHM)
  end

  def self.decode(token)
    decoded = JWT.decode(token, public_key, true, algorithm: ALGORITHM)
    HashWithIndifferentAccess.new(decoded[0])
  rescue JWT::DecodeError
    nil
  end
end
