class User::Contract::Create < Reform::Form
  property :username
  property :password
  property :password_confirmation

  validates :username, length: { minimum: 3 }
  validates_uniqueness_of :username

  validates :password_confirmation, :password, presence: true
  validate :password_ok?

  def password_ok?
    errors.add(:password, I18n.t('errors.password_missmatch')) if password != password_confirmation
  end
end
