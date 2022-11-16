class Subjectdate < ApplicationRecord
  enum :week_day, [ :Lunes, :Martes, :Miercoles, :Jueves, :Viernes, :Sabado, :Domingo ]

  belongs_to :subject
end
