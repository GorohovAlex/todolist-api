class TaskComment < ApplicationRecord
  belongs_to :task
  mount_uploader :image, ImageUploader
end
