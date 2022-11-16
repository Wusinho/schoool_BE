require 'faker'
password = '123456'
first_name = Faker::Name.first_name
last_name = Faker::Name.middle_name
email = "student_1@gmail.com"

FactoryBot.define do
  factory :student do
     name { first_name }
     surname { last_name }
     email { email }
     password { password }
     password_confirmation { password }
     active { true }
     classroom
  end
end
