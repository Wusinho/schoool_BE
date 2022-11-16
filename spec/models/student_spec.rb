require 'rails_helper'

RSpec.describe Student, type: :model do
  describe Student do
    it do
      should belong_to(:classroom)
      should validate_presence_of(:name)
      should validate_presence_of(:email)
      should validate_presence_of(:surname)
      should validate_presence_of(:email)
      should validate_presence_of(:password_digest)
    end
  end
end
