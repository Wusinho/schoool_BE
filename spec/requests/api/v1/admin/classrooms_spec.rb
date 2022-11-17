require 'rails_helper'

RSpec.describe "Api::V1::Admin::Classrooms", type: :request do
  describe "POST /api/v1/admin/classrooms" do
    let!(:edlevel) { create(:edlevel) }
    let!(:section) { create(:section) }
    let!(:admin) { create(:admin) }

    it 'should create a classroom' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        edlevel_id: edlevel.id,
        section_id: section.id,
        participants: 20,
      }

      post '/api/v1/admin/classrooms', params: req_params,
           headers: {
             'Authorization' => token
           }
      expect(response).to have_http_status(:created)
    end

    it 'should not create a room if no participants' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        edlevel_id: edlevel.id,
        section_id: section.id,
        participants: ''
      }

      post '/api/v1/admin/classrooms', params: req_params,
           headers: {
             'Authorization' => token
           }

      expect(response).to have_http_status(:unprocessable_entity)

    end

  end
end
