require 'rails_helper'
require 'helpers/authorization_helper'

RSpec.describe "Api::v1::Student::Registrations", type: :request do
  include AuthorizationHelper

  describe "POST /api/v1/student/registrations" do
    let(:classroom) { create(:classroom) }
    let!(:student) { create(:student)}

     it 'should create a post' do
       req_payload = correct_student_params

       post "/api/v1/student/registrations", params: req_payload
       payload = JSON.parse(response.body)

       expect(payload['name']).to_not be_empty
       expect(response).to have_http_status(:ok)
     end

      it 'should not create a student when a required params is not sent' do
        req_payload = missing_student_surname

        post "/api/v1/student/registrations", params: req_payload
        payload = JSON.parse(response.body)
        resp = JSON.parse(response.body)

        expect(payload['error']).to eql({"surname"=>["can't be blank"]})
        expect(resp['status']).to eql('unprocessable_entity')
      end


      it 'should not create student when duplicated emails' do
        req_payload = duplicated_student_email

        post "/api/v1/student/registrations", params: req_payload
        payload = JSON.parse(response.body)
        resp = JSON.parse(response.body)

        expect(payload['error']).to eql({"email"=>["has already been taken"]})
        expect(resp['status']).to eql('unprocessable_entity')
      end
  end
end
