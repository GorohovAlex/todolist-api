RSpec.describe Task::Operation::Index do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { project_id: project.id } }

  describe 'when authorized user' do
    it { expect(result.success?).to be true }
  end

  describe 'when not authorized user' do
    let(:params) { {} }

    it { expect(result.failure?).to be true }
  end
end
