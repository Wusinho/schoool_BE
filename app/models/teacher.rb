class Teacher < ApplicationRecord
  include EmailValidation

  has_many :subjects
  has_many :teaching_subjects, through: :subjects, source: :course
  has_many :teaching_classrooms, through: :subjects, source: :classroom
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
    self.surname = surname.capitalize
  end

end
