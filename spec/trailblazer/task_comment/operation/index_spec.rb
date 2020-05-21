RSpec.describe TaskComment::Operation::Index do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project_id: project.id) }
  let(:task_comment) { create_list(:task_comment, rand(1..10), task_id: task.id) }
  let(:params) { { task_id: task.id } }

  describe 'when authorized user' do
    it { expect(result.success?).to be true }
  end

  describe 'when other user' do
    subject(:result) { described_class.call(params: params, current_user: user_fail) }

    let(:user_fail) { create(:user) }

    it { expect(result[:model].count).to eq 0 }
  end
end
