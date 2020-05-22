class TaskComment::Contract::Base < Reform::Form
  property :comment
  property :task_id
  property :image
end
