module EmailValidation
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    has_secure_password

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates_presence_of :name, :surname, :email, :password_digest
    before_save :capitalize_all

    def capitalize_all
      self.name = name.capitalize
      self.surname = surname.capitalize
    end


  end



end
