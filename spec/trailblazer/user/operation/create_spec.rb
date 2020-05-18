RSpec.describe User::Operation::Create do
  let(:params) { { user: attributes_for(:user) } }

  it do
    result = described_class.call(params: params)
    expect(result).to be_success
  end
end
