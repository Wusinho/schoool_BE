class Timetable < ApplicationRecord
  belongs_to :subject
  enum :week_day, [ :Lunes, :Martes, :Miercoles, :Jueves, :Viernes, :Sabado, :Domingo ]
  validates_presence_of :starts_at, :ends_at, :week_day

end
