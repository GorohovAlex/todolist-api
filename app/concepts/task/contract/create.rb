class Task::Contract::Create < Task::Contract::Base
  validates :name, presence: true
  validates :project_id, presence: true
end
