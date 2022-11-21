class Student < ApplicationRecord
  include EmailValidation

  belongs_to :classroom
  has_many :students_grade, through: :classroom, source: :grade_level


  def students_courses
    self.classroom.classroom_courses
  end

end
