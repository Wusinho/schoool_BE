require 'rails_helper'

RSpec.describe "Api::V1::Admin::Subjects", type: :request do
  describe "POST /api/v1/admin/subject" do
    let!(:admin) { create(:admin)}
    let!(:course) { create(:course) }
    let!(:teacher) { create(:teacher) }
    let!(:classroom) { create(:classroom) }

    it 'should create a subject' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        times_week: '2',
        classroom_id: classroom.id,
        course_id: course.id,
        teacher_id: teacher.id
      }
      post '/api/v1/admin/subjects', params: req_params,
           headers: { 'Authorization' => token }

      expect(response).to have_http_status(:created)
    end

    it 'should not create a subject if a strong param missing' do
      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        times_week: '',
        classroom_id: classroom.id,
        course_id: course.id,
        teacher_id: teacher.id
      }

      post '/api/v1/admin/subjects', params: req_params,
           headers: { 'Authorization' => token  }

      expect(response).to have_http_status(:unprocessable_entity)

    end

  end
end
