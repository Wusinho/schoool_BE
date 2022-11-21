class GradeLevel < ApplicationRecord
  enum :grade_level, [ :primaria, :secundaria ]
  enum :section, [:A, :B, :C, :D, :E]

  validates_presence_of :grade_level, :section, :grade
  validates_numericality_of :grade_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, message: 'El valor esta entre 0 y 1'
  validates_numericality_of :grade, greater_than_or_equal_to: 1, less_than_or_equal_to: 6, message: 'El valor esta entre 1 y 6'
  validates_numericality_of :section, greater_than_or_equal_to: 0, less_than_or_equal_to: 4, message: 'El valor esta entre 0 y 4'



end
