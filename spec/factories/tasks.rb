FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.phrase }
    state { [true, false].sample }
    project

    trait :in_process do
      state { true }
    end

    trait :done do
      state { false }
    end
  end
end
