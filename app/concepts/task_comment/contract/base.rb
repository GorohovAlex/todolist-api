class TaskComment::Contract::Base < Reform::Form
  property :comment
  property :task_id
  property :image

  validates :comment, presence: true
  validates :task_id, presence: true, numericality: true
end
