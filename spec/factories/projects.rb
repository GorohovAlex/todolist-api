FactoryBot.define do
  factory :project do
    name { FFaker::Lorem.phrase }
  end
end
