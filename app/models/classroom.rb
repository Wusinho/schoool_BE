class Classroom < ApplicationRecord
  belongs_to :student_level
  has_many :subjects
  has_many :cursos, through: :subjects, source: :course
  validates_presence_of :participants
  validates_numericality_of :participants, greater_than_or_equal_to: 1, less_than_or_equal_to: 50, message: 'El valor esta entre 1 y 50'
end
