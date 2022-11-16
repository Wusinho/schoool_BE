require 'rails_helper'
require 'helpers/mock_admin_session'

RSpec.describe "Api::V1::Admin::Courses", type: :request do
  include MockAdminSession
  let!(:admin) { create(:admin) }

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
  end
end
