class Task::Contract::Base < Reform::Form
  property :name
  property :project_id
  property :deadline
  property :state

  validates :project_id, numericality: true
  validate :deadline_at_is_valid_datetime

  def deadline_at_is_valid_datetime
    return true unless deadline.present?

    DateTime.parse(deadline)
  rescue StandardError
    errors.add(:deadline, I18n.t('errors.deadline'))
  end
end
