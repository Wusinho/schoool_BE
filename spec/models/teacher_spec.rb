require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe Teacher do
    context 'validations' do
      it do
        should have_many(:subjects)
        should validate_presence_of(:name)
        should validate_presence_of(:surname)
        should validate_presence_of(:email)
        should validate_presence_of(:password_digest)
      end
    end
  end
end
