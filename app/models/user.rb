class User < ApplicationRecord
  validates_presence_of :name, :surname, :grade, :section, :email
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
    self.section = surname.capitalize
  end

end
