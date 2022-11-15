module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
