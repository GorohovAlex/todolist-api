FactoryBot.define do
  factory :task_comment do
    comment { FFaker::Lorem.phrase }
    task
  end
end
