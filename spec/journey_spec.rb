require 'journey'

describe Journey do

  let(:oystercard) {Oystercard.new}
  let(:entry_station) {Station.new(name: "Mayfair", zone: "Zone 1")}
  let(:exit_station) {Station.new(name: "Kings Cross", zone: "Zone 2")}

  before(:each) do
    oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  it "should start a journey" do
    oystercard.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it "should end a journey" do
    oystercard.touch_out(exit_station)
    expect(subject).not_to be_in_journey
end
