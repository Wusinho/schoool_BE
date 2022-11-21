class Subject < ApplicationRecord
  has_many :timetables
  belongs_to :course
  belongs_to :classroom
  validates_presence_of :times_week
end
