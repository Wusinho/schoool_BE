require 'rails_helper'

RSpec.describe Edlevel, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:section) }
  end
end
