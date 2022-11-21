class Student < ApplicationRecord
  has_secure_password
  belongs_to :classroom
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :surname, :email, :password_digest
  before_save :capitalize_all

  has_many :students_grade, through: :classroom, source: :grade_level

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

  def students_courses
    self.classroom.classroom_courses
  end

end
