class Subject < ApplicationRecord
  has_many :subjectdates
  belongs_to :teacher
  belongs_to :classroom
  accepts_nested_attributes_for :subjectdates
end
