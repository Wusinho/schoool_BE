require 'rails_helper'

RSpec.describe "Api::V1::Admin::Courses", type: :request do
  let!(:admin) { create(:admin) }
  let!(:student) { create(:student) }

  describe "POST /api/v1/admin/courses" do
    it 'should create a post' do
      token = JsonWebToken.encode(admin_id: admin.id)
      req_params = {
        name: 'Matematicas'
      }

      post '/api/v1/admin/courses', params: req_params, headers: {
        'Authorization' => token
      }

      expect(response).to have_http_status(:created)

    end

    it 'should not create a post if somebody besides an admin tries to' do
      token = JsonWebToken.encode(admin_email: student.email)
      req_params = {
        name: 'Matematicas'
      }

      post '/api/v1/admin/courses', params: req_params, headers: {
        'Authorization' => token
      }

      expect(response).to have_http_status(:forbidden)

    end

  end
end
