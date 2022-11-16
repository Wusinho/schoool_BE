require 'rails_helper'

RSpec.describe Course, type: :model do
  describe Course do
    context 'validations' do
      it do
        should validate_presence_of(:name)
      end
    end
  end
end
