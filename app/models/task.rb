class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :task
end
