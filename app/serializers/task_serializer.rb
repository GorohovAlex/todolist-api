class TaskSerializer < BaseSerializer
  attribute :name
  attribute :state
  attribute :deadline do
    object.deadline.nil? ? '' : object.deadline
  end
  attribute :position
  attribute :created_at
  attribute :updated_at
end
