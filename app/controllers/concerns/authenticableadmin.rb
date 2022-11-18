module Authenticableadmin
  def authenticate_admin!

    header = request.headers['Authorization']
    head :forbidden and return if header.blank?

    decoded = JsonWebToken.decode(header).first
    admin = Admin.find_by(email: decoded['admin_email'])
    head :forbidden unless admin
  end
end
