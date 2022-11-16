require 'rails_helper'

RSpec.describe "Api::v1::Admin::Session", type: :request do

  describe "POST /api/v1/admin/sessions" do
    let!(:admin) { create(:admin) }

    it 'should create a session for the admin' do
      req_payload = {
        email: admin.email,
        password: '123456'
      }

      post '/api/v1/admin/sessions', params: req_payload
      payload = JSON.parse(response.body)

      expect(payload['name']).to eql(admin.name)
      expect(response).to have_http_status(:ok)

    end

    it 'should not create a session for the admin when given the wrong password' do
      req_payload = {
        email: admin.email,
        password: '123'
      }

      post '/api/v1/admin/sessions', params: req_payload
      payload = JSON.parse(response.body)

      expect(payload['error']).to eql('Wrong email/password')
      expect(payload['status']).to eql('not_found')

    end

  end
end
