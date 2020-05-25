RSpec.describe Project, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:user) }
  end
end
