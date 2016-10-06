require_relative 'journey'
require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

attr_reader :balance, :entry_station, :exit_station, :in_journey, :journeys
  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds for jouney' if @balance < MINIMUM_BALANCE
    new_journey(station)
    @in_journey = true
  end

  def touch_out(station)
    end_journey(station)
    deduct(@current_journey.fare)
    @current_journey = nil
  end

private

  def add_journey
    @journeys << @current_journey
    @in_journey = false
  end

  def deduct(amount)
    @balance -= amount
  end

  def new_journey(station)
    if @in_journey == true
      @current_journey.penalty_finish
      deduct(@current_journey.fare)
      add_journey
    else
      @current_journey = Journey.new(station)
    end
  end

  def end_journey(station)
    if @in_journey == true
      @current_journey.finish(station)
      add_journey
      # @current_journey = nil
    else
      @current_journey = (Journey.new).finish(station)
      add_journey
      # @current_journey = nil
    end
  end
end
