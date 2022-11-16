require 'faker'

# authorization helper
module AuthorizationAdminHelper
  def correct_student_params
    {
      name: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456',
    }
  end

  def missing_admin_surname
    {
      name: Faker::Name.first_name,
      surname: '',
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456',
    }
  end

  def duplicated_admin_email
    {
      name: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      email: 'student_1@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      classroom_id: classroom.id
    }
  end

  def register_user(user)
    post '/api/v1/registrations', params: user
  end

  def users_session(user)
    session_params = {
      user: {
        email: user[:user][:email],
        password: user[:user][:password]
      }
    }
    post '/api/v1/sessions', params: session_params
    JSON.parse(response.body)
  end
end
