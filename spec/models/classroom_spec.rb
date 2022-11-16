require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe Classroom do
    it do
      should belong_to(:edlevel)
      should belong_to(:section)
    end
  end
end
