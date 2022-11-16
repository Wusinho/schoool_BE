require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe Classroom do
    context 'validations' do
      it do
        should belong_to(:edlevel)
        should belong_to(:section)
        should validate_presence_of(:participants)
      end
    end

  end
end
