module Authenticableadmin
  def authenticate_admin
    return @current_admin if @current_admin

    header = request.headers['Authorization']
    p '*'*100
    p request
    p header
    p '*'*100
    return if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_admin = Admin.find(decoded[:admin_id])
  rescue StandardError => e
    e.message
  end
end
