RSpec.describe Task::Operation::Index do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { project_id: project.id } }
  let!(:tasks) { create_list(:task, rand(1..10), project: project) }

  describe 'when authorized user' do
    it { expect(result.success?).to be true }
    it { expect(result[:model].count).to eq tasks.count }
  end

  describe 'when other user' do
    subject(:result) { described_class.call(params: params, current_user: user_fail) }

    let(:user_fail) { create(:user) }

    it { expect(result.failure?).to be true }
  end
end
