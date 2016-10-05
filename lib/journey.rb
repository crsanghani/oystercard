require 'oystercard'

class Journey

  def initialize(entry_station)
    @in_journey =  true
    @entry_station = entry_station
  end

  def in_journey?
    @in_journey
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @in_journey = false
  end

  private

  def journey
    {entry_station: entry_station, exit_station: exit_station}
  end
end
