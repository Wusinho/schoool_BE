require 'rails_helper'

RSpec.describe "Api::V1::Admin::Courses", type: :request do
  let!(:admin) { create(:admin) }
  let!(:student) { create(:student) }
  let!(:teacher) { create(:teacher) }

  describe "POST /api/v1/admin/courses" do
    it 'should create a course' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = { name: 'Matematicas' }

      post '/api/v1/admin/courses', params: req_params,
           headers: { 'Authorization' => token }

      expect(response).to have_http_status(:created)
    end

    it 'should not create a course if missing strong params' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = { name: '' }

      post '/api/v1/admin/courses', params: req_params,
           headers: { 'Authorizatio' => token }

      payload = JSON.parse(response.body)
      expect(payload['error']).to eql({"name"=>["can't be blank"]})
      expect(payload['status']).to eql('unprocessable_entity')
    end

    it 'should not create a course if a Student tries to' do
      token = JsonWebToken.encode(admin_email: student.email)
      req_params = { name: 'Matematicas' }

      post '/api/v1/admin/courses', params: req_params,
           headers: { 'Authorization' => token }

      expect(response).to have_http_status(:forbidden)
    end

    it 'should not create a course if a Teacher tries to' do
      token = JsonWebToken.encode(admin_email: teacher.email)
      req_params = { name: 'Matematicas' }

      post '/api/v1/admin/courses', params: req_params,
           headers: { 'Authorization' => token }

      expect(response).to have_http_status(:forbidden)
    end

  end
end
