require 'rails_helper'

RSpec.describe "Api::V1::Teacher::Session", type: :request do
  describe "POST /api/v1/teacher/sessions" do
    it "works! (now write some real specs)" do
      get api_v1_teachers_path
      expect(response).to have_http_status(200)
    end
  end
end
