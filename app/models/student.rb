class Student < ApplicationRecord
  has_secure_password
  belongs_to :edlevel
  belongs_to :section
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :surname, :email, :password_digest
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

end