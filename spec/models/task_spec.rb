RSpec.describe Task, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:project) }
  end
end
