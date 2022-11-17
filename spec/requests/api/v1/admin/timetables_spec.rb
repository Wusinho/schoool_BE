require 'rails_helper'

RSpec.describe "Api::V1::Admin::Timetables", type: :request do
  let!(:admin) { create(:admin) }
  let!(:now) { [7,8,9].sample }

  describe "POST /api/v1/admin/timetables" do
      it 'should create a subject' do

      token = JsonWebToken.encode(admin_email: admin.email)
      req_params = {
        week_day: 1,
        starts_at: now,
        ends_at: now + 2
      }

      post '/api/v1/admin/timetables', params: req_params,
           headers: {
             'Authorization' => token
           }

      expect(response).to have_http_status(:created)
      end

      it 'should not create a subject if a strong param is missing' do
        token = JsonWebToken.encode(admin_email: admin.email)
        req_params = {
          week_day: '',
          starts_at: now,
          ends_at: now + 2
        }

        post '/api/v1/admin/timetables', params: req_params,
             headers: {
               'Authorization' => token
             }

        expect(response).to have_http_status(:unprocessable_entity)

      end


  end
end
