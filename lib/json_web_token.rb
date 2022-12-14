class JsonWebToken
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY)
    # HashWithIndifferentAccess.new(decoded)
  end

  private

  SECRET_KEY = 'secreto'


end
