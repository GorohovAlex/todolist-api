RSpec.describe User::Operation::Create do
  let(:user_new) { build(:user) }

  it do
    result = described_class.call(params: { user: user_new.attributes })
    expect(result).to be_success
  end
end
