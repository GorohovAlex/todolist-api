RSpec.describe Task::Operation::Delete do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:params) { { task: attributes_for(:task), id: task.id } }

  describe 'when valid data' do
    it { expect(result.success?).to be true }
  end

  describe 'when invalid data' do
    let(:params) { {} }

    it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
