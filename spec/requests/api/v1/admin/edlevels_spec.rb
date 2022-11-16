require 'rails_helper'

RSpec.describe "Api::V1::Admin::Edlevels", type: :request do
  let!(:admin) { create(:admin) }
  let!(:teacher) {create(:teacher)}
  let!(:student) {create(:student)}

  describe "POST /api/v1/admin/edlevels" do


    let 'should create a edlevel' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        nivel: 1,
        ed_level: 5,
      }

      post '/api/v1/admin/edlevels', params: req_params,
           headers: { 'Authorization' => token }

      payload = JSON.parse(response.body)

      expect(payload).to eql(:forbidden)
    end


  end
end
