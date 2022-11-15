class Teacher < ApplicationRecord
  has_secure_password
  has_many :subjects
  has_many :edlevels
  has_many :sections
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :surname, :email, :password_digest
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
    self.section = section.capitalize
  end

end
