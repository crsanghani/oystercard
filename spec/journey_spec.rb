require 'journey'

let(:oystercard) {Oystercard.new}

describe Journey do
  before(:each) do
    oystercard.top_up(MAXIMUM_BALANCE)
  end

  it "should start a journey" do
    oystercard.touch_in
    expect(subject).to be_in_journey
  end

end
