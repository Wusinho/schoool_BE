class Edlevel < ApplicationRecord
  enum :nivel, [ :primaria, :secundaria ]

  validates_presence_of :ed_level, :nivel
  validates_numericality_of :nivel, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, message: 'El valor esta entre 0 y 1'
  validates_numericality_of :ed_level, greater_than_or_equal_to: 1, less_than_or_equal_to: 6, message: 'El valor esta entre 1 y 6'


end
