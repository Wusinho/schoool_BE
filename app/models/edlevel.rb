class Edlevel < ApplicationRecord
  enum :nivel, [ :primary, :secondary ]

  validates_presence_of :ed_level, :nivel
  validates_numericality_of :nivel, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, message: 'El valor esta entre 0 y 1'

end
