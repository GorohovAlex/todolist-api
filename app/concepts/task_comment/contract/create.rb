class TaskComment::Contract::Create < TaskComment::Contract::Base
  validates :comment, presence: true
  validates :task_id, presence: true, numericality: true
end
