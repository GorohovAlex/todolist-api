RSpec.describe TaskComment, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:task) }
  end
end
