RSpec.describe Project::Operation::Update do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { project: attributes_for(:project), id: project.id } }

  describe 'when valid data' do
    it do
      expect(result.success?).to be true
    end
  end

  describe 'when invalid data' do
    let(:params) { { project: { name: '' }, id: project.id } }

    it { expect(result.failure?).to be true }
  end
end
