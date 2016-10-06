class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :fare, :entry_station, :finish

  def initialize(station = nil)
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

  def penalty_finish
    @complete = false
    @fare = PENALTY_FARE
    self
  end

  #private

  def calculate_fare
    if !@entry_station.nil?
      @fare = MINIMUM_FARE
    end
  end
end
