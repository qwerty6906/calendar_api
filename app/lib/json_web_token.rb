class JsonWebToken
  class << self
    def encode(payload, exp=1.year.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, secret)
    end

    def decode(token)
      payload = JWT.decode(token, secret).first
      HashWithIndifferentAccess.new payload
    rescue
      nil
    end

    private

    def secret
      Rails.application.credentials[:secret_key_base]
    end
  end
end