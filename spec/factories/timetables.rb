FactoryBot.define do
  factory :timetable do
    start = [8,9,10,11,12,13,14,15,16,17,18,19,20,21].sample
    week_day { [0,1,2,3,4,5,6].sample }
    starts_at { start }
    ends_at { start + 2 }
  end
end
