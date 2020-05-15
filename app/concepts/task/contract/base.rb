class Task::Contract::Base < Reform::Form
  property :name
  property :project_id

  validates :name, presence: true
  validates :project_id, presence: true
end
