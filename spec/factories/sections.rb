FactoryBot.define do
  factory :section do

    trait :good do
      section { 1 }
    end

    trait :bad do
      section { '' }
    end

    trait :scope do
      section { 10 }
    end

  end
end
