class Subjectdate < ApplicationRecord
  belongs_to :subject
  belongs_to :timetable
end
