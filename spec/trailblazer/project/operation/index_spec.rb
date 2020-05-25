RSpec.describe Project::Operation::Index do
  subject(:result) { described_class.call(params: nil, current_user: user) }

  let(:user) { create(:user) }

  describe 'when authorized user' do
    it { expect(result.success?).to be true }
    it { expect { result }.to change(result[:model], :count).by(user.projects.count) }
  end

  describe 'when not authorized user' do
    let(:user) { nil }

    it { expect(result.failure?).to be true }
  end
end
