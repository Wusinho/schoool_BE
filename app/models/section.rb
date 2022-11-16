class Section < ApplicationRecord
  enum :section, [ :A, :B, :C, :D, :E ]

  validates :section, presence: true
  validates_numericality_of :section, greater_than_or_equal_to: 0, less_than_or_equal_to: 4, message: 'El valor esta entre 0 y 4'

end
