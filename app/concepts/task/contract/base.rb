class Task::Contract::Base < Reform::Form
  property :name
  property :project_id
  property :deadline
  property :state

  validates :name, presence: true
  validates :project_id, presence: true, numericality: true

  validate :deadline_at_is_valid_datetime

  def deadline_at_is_valid_datetime
    return true unless deadline.present?

    if (begin
           DateTime.parse(deadline)
        rescue StandardError
          ArgumentError
         end) == ArgumentError
      errors.add(:deadline, I18n.t('errors.deadline'))
     end
  end
end
