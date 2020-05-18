class User::Contract::Create < Reform::Form
  USERNAME_LENGTH = (3..50).freeze
  PASSWORD_MIN_LENGTH = 6

  property :username
  property :password
  property :password_confirmation

  validates :username, length: USERNAME_LENGTH
  validates_uniqueness_of :username

  validates :password, length: { minimum: PASSWORD_MIN_LENGTH }

  validates :password_confirmation, :password, presence: true
  validate :password_ok?

  def password_ok?
    errors.add(:password, I18n.t('errors.password_missmatch')) if password != password_confirmation
  end
end
