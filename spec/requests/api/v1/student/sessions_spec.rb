require 'rails_helper'

RSpec.describe "Api::V1::Student::Sessions", type: :request do
  describe "Post /api/v1/student/sessions" do
    let!(:student ) { create(:student)}

    it 'should create a session for the student' do
      req_payload = {
        session:{
          email: student.email,
          password: '123456'
        }
      }

      post "/api/v1/student/sessions", params: req_payload
      payload = JSON.parse(response.body)

      expect(payload['name']).to_not be_empty
      expect(response).to have_http_status(:ok)
    end

    it 'should not create a session with an incorrect password' do
      req_payload = {
        session:{
          email: student.email,
          password: 'fwfdsfasfsd'
        }
      }

      post "/api/v1/student/sessions", params: req_payload
      payload = JSON.parse(response.body)

      expect(payload['error']).to eql('Wrong email/password')
      expect(payload['status']).to eql('not_found')
    end

  end
end
