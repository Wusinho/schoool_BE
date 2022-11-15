class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :surname, :grade, :section, :email, :password_digest
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
    self.section = surname.capitalize
  end

end
