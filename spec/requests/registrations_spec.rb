require 'rails_helper'
require 'helpers/authorization_helper'

RSpec.describe "Api::v1::Registrations", type: :request do
  include AuthorizationHelper

  describe "POST /api/v1/registrations" do
    let(:classroom) { create(:classroom) }

    it 'should create a post' do
      req_payload = correct_student_params

      post "/api/v1/registrations", params: req_payload
      payload = JSON.parse(response.body)

      expect(payload['name']).to_not be_empty
      expect(response).to have_http_status(:ok)
    end

    it 'should not create a post when a required data is not sent' do
      req_payload = missing_student_surname

      post "/api/v1/registrations", params: req_payload
      payload = JSON.parse(response.body)
      resp = JSON.parse(response.body)

      expect(payload).to_not be_empty
      expect(payload['error']).to eql({"surname"=>["can't be blank"]})
      expect(resp['status']).to eql('unprocessable_entity')
    end

  end
end
