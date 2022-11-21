class Subject < ApplicationRecord
  has_many :timetables
  belongs_to :course
  belongs_to :classroom
  belongs_to :teacher
  validates_presence_of :times_week
  validates_numericality_of :times_week, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: 'El valor esta entre 1 y 5'

end
