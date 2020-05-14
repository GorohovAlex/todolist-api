RSpec.describe Session::Operation::Create do
  let(:user) { create(:user) }
  let(:params) { { username: user.username, password: user.password } }

  it do
    result = described_class.call(params: params)
    expect(result).to be_success
  end
end
