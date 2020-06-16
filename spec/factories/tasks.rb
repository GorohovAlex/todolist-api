FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.phrase }
    state { [true, false].sample }
    deadline { '2019-04-03T04:04:02+08:00' }
    project

    trait :in_process do
      state { true }
    end

    trait :done do
      state { false }
    end
  end
end
