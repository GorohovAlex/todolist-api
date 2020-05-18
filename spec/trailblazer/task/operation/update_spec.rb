RSpec.describe Task::Operation::Update do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:params) { { task: attributes_for(:task), state: true, id: task.id } }

  describe 'when valid data' do
    it { expect(result.success?).to be true }
  end

  describe 'when invalid data' do
    let(:params) { { task: { name: '' }, id: task.id } }

    it { expect(result.failure?).to be true }
  end
end
