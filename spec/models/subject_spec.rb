require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe Subject do
    context 'validations' do
      it do
        should have_many(:timetables)
        should belong_to(:teacher)
        should belong_to(:course)
        should belong_to(:classroom)
      end
    end
  end
end
