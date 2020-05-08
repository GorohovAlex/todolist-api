RSpec.describe Users::Operation::Create do
  it do
    result = described_class.call(username: 'string', password: 'string')
    expect(result).to be_success
  end
end
