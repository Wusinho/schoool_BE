class Admin < ApplicationRecord
  include EmailValidation

  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

end
