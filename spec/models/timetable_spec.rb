require 'rails_helper'

RSpec.describe Timetable, type: :model do
  describe Timetable do
    context 'validations' do
      it do
        should validate_presence_of(:ends_at)
        should validate_presence_of(:starts_at)
      end
    end
  end
end
