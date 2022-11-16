require 'rails_helper'

RSpec.describe "Api::V1::Teacher::Session", type: :request do
  describe "POST /api/v1/teacher/sessions" do
    let!(:teacher) { create(:teacher) }

    it 'should create a session for the teacher' do
      req_params = {
        email: teacher.email,
        password: '123456'
      }

      post '/api/v1/teacher/sessions', params: req_params
      payload = JSON.parse(response.body)

      expect(payload['name']).to eql(teacher.name)
      expect(response).to have_http_status(:ok)
    end

    it 'should not create a session for the teacher' do
      req_params = {
        email: teacher.email,
        password: '23'
      }

      post '/api/v1/teacher/sessions', params: req_params
      payload = JSON.parse(response.body)

      expect(payload['error']).to eql('Wrong email/password')
      expect(payload['status']).to eql('not_found')


    end

  end
end
