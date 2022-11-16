class Course < ApplicationRecord
  belongs_to :subject
  validates_presence_of :name
  before_save :capitalize_all

  def capitalize_all
    self.name = name.capitalize
  end

end
