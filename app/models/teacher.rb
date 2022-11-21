class Teacher < ApplicationRecord
  has_secure_password
  has_many :subjects
  has_many :teaching_subjects, through: :subjects, source: :course
  has_many :teaching_classrooms, through: :subjects, source: :classroom
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :surname, :email, :password_digest
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

end
