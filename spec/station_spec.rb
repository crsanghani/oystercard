require 'station'

describe Station do

  subject { described_class.new(name: "Kings Cross", zone: 2) }

  it 'has a name' do
    expect(subject.name).to eq("Kings Cross")
  end

  it 'has a name' do
    expect(subject.zone).to eq(2)
  end
end
