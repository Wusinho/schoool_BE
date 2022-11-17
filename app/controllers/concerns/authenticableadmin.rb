module Authenticableadmin
  def authenticate_admin!

    header = request.headers['Authorization']
    return if header.blank?

    decoded = JsonWebToken.decode(header).first
    p '*'*100
    p decoded
    p '*'*100
    admin = Admin.find_by(email: decoded['admin_email'])
    head :forbidden unless admin
  end
end
