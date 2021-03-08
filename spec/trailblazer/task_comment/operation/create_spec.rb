RSpec.describe TaskComment::Operation::Create do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project_id: project.id) }
  let(:params) { { task_comment: attributes_for(:task_comment), task_id: task.id } }

  describe 'when valid data' do
    it { expect(result.success?).to be true }
    it { expect { result }.to change(TaskComment, :count).by(1) }
  end

  describe 'when invalid data' do
    let(:params) { { task_comment: {}, task_id: task.id } }

    it { expect(result.failure?).to be true }
  end
end
