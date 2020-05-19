class TaskCommentSerializer < BaseSerializer
  attribute :comment
  attribute :task_id
  attribute :image  
  attribute :created_at
  attribute :updated_at
end
