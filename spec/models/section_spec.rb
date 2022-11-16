require 'rails_helper'

RSpec.describe Section, type: :model do
  describe Section do
    context 'validations' do
      it do
        should validate_presence_of(:section)
      end
    end
  end
end
