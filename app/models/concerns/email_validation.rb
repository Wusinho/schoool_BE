module EmailValidation
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    has_secure_password

    validates :email, uniqueness: true
    validates_format_of :email, with: /@/
    validates_presence_of :name, :surname, :email, :password_digest
  end



end
