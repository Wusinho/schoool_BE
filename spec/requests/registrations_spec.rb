require 'rails_helper'
require 'faker'

RSpec.describe "Api::v1::Registrations", type: :request do
  describe "POST /api/v1/registrations" do
    let(:classroom) { create(:classroom) }

    it 'should create a post' do
      req_payload ={
        registration:{
          name: Faker::Name.first_name,
          surname: Faker::Name.last_name,
          email: Faker::Internet.email,
          password: '123456',
          password_confirmation: '123456',
          classroom_id: classroom.id
        }
      }
      post "/api/v1/registrations", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to have_http_status(:ok)
    end

    it 'should not create a post when a required data is not sent' do
      req_payload ={
        registration:{
          name: Faker::Name.first_name,
          surname: '',
          email: Faker::Internet.email,
          password: '123456',
          password_confirmation: '123456',
          classroom_id: classroom.id
        }
      }
      post "/api/v1/registrations", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      resp = JSON.parse(response.body)
      expect(payload['error']).to eql({"surname"=>["can't be blank"]})
      expect(resp['status']).to eql('unprocessable_entity')
    end

  end
end
