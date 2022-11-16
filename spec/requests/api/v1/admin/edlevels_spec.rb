require 'rails_helper'

RSpec.describe "Api::V1::Admin::Edlevels", type: :request do
  let!(:admin) { create(:admin) }
  let!(:teacher) {create(:teacher)}
  let!(:student) {create(:student)}

  describe "POST /api/v1/admin/edlevels" do

    it 'should create a edlevels' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        ed_level: 5,
        nivel: 0,
      }

      post '/api/v1/admin/edlevels', params: req_params,
           headers: { 'Authorization' => token }

      expect(response).to have_http_status(:created)
    end


  end
end
