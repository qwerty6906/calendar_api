class JsonWebToken
  class self <<
    def encode(payload, exp=1.yaer.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, secret)
    end

    def decode(token)
      payload = JWT.decode(token, secret).firts
      HashWithIndifferentAccess.new payload
    rescue
      nil
    end

    private

    def secret
      Rails.application.secrets.secret_key_base
    end
  end
end