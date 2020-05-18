class TaskSerializer < BaseSerializer
  attribute :name
  attribute :state
  attribute :deadline
  attribute :created_at
  attribute :updated_at
end
