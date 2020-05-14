RSpec.describe Project::Operation::Delete do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { id: project.id } }

  describe 'when valid data' do
    it { expect(result.success?).to be true }
    it { expect { result }.to change(Project, :count).by(-1) }
  end

  describe 'when invalid data' do
    let(:params) { { project: {} } }
    it { expect(result.failure?).to be true }
  end
end
