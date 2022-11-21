class Student < ApplicationRecord
  include EmailValidation

  belongs_to :classroom
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
