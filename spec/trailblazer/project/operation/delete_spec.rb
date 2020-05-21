RSpec.describe Project::Operation::Delete do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { id: project.id } }

  describe 'when valid data' do
    it { expect(result.success?).to be true }
  end

  describe 'when invalid data' do
    let(:params) { { project: {} } }

    it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
