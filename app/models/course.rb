class Course < ApplicationRecord
  validates_presence_of :name
  before_save :capitalize_all
  has_many :subjects
  has_many :course_schedule, through: :subjects, source: :timetables

  def capitalize_all
    self.name = name.capitalize
  end

end
