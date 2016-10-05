require 'journey'
require 'station'
require 'oystercard'

describe Journey do

  # let(:oystercard) {Oystercard.new}
  let(:entry_station) {Station.new(name: "Mayfair", zone: "Zone 1")}
  let(:exit_station) {Station.new(name: "Kings Cross", zone: "Zone 2")}
  subject { described_class.new(entry_station) }

  # before(:each) do
  #
  # end

  it "should start a journey" do
    expect(subject).to be_in_journey
  end

  it "should end a journey" do
    subject.finish_journey(exit_station)
    expect(subject).not_to be_in_journey
  end

  describe "#fare" do
    it "calculates the fare" do
      subject.finish_journey(exit_station)
      expect(subject.fare).to eq Oystercard::MINIMUM_BALANCE
    end
  end
end
