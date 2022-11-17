class Timetable < ApplicationRecord
  enum :week_day, [ :Lunes, :Martes, :Miercoles, :Jueves, :Viernes, :Sabado, :Domingo ]
  validates_presence_of :starts_at, :ends_at, :week_day

  before_save :change_time_format

  def change_time_format
    self.starts_at = starts_at.strftime("%I:%M")
    self.ends_at = ends_at.strftime("%I:%M")
  end

end
