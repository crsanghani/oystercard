class Station

  attr_reader :name, :zone

  def initialize(name: "Station Name", zone: "Station Zone")
    @name = name
    @zone = zone
  end

end
