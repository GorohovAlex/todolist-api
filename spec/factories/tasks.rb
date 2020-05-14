FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.phrase }
    project
  end
end
