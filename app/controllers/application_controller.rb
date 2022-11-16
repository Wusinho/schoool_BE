class ApplicationController < ActionController::API
  include Authenticable
  include Authenticableadmin
  include Authenticableteacher

end
