module Authenticableadmin
  def current_admin
    return @current_admin if @current_admin

    header = request.headers['Authorization']
    return if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_admin = Admin.find(decoded[:admin_id])
  end
end
