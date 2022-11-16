require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:section) }
  end
end
