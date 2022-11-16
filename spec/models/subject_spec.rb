require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe Subject do
    context 'validations' do
      it do
        should belong_to(:teacher)
        should belong_to(:course)
        should belong_to(:classroom)
        should have_many(:subjectdates)
      end
    end
  end
end
