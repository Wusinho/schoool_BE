require 'faker'

FactoryBot.define do
  factory :admin do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { 'admin@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
