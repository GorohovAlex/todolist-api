class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project
  has_many :task_comments
end
