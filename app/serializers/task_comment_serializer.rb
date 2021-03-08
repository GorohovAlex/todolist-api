class TaskCommentSerializer < BaseSerializer
  attribute :comment
  attribute :task_id
  attribute :image do
    object.image.url.nil? ? {} : object.image
  end
  attribute :created_at
  attribute :updated_at
end
