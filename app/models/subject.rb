class Subject < ApplicationRecord
  has_many :subjectdates
  accepts_nested_attributes_for :subjectdates
end
