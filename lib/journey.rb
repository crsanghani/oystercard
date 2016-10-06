require 'oystercard'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :fare, :entry_station, :finish

  def initialize(station)
    @fare = PENALTY_FARE
    @complete = false
    @entry_station = station
  end

  def complete?
    @complete
  end

  def finish(station)
    @exit_station = station
    @complete = true
    calculate_fare
    self
  end

  #private

  def calculate_fare
    @fare = MINIMUM_FARE
  end

end
