class Subject < ApplicationRecord
  has_many :subjectdates
  belongs_to :teacher
  belongs_to :course
  belongs_to :classroom
end
