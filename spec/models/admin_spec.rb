require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe Admin do
    context 'validations' do
      it do
        should validate_presence_of(:name)
        should validate_presence_of(:surname)
        should validate_presence_of(:email)
        should validate_presence_of(:password_digest)
      end
    end
  end
end
