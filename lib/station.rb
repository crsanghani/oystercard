

class Station

attr_reader :name, :zone

  def initialize(station, zone = na)
    @name = station
    @zone = zone
  end

end
