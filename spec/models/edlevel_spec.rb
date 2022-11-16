require 'rails_helper'

RSpec.describe Edlevel, type: :model do
  describe Edlevel do
    context 'validations' do
      it do
        should validate_presence_of(:nivel)
        should validate_presence_of(:edlevel)
      end
    end
  end
end
