class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end

end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

# Further exploration: the case against including wheels in Vehicle is stronger than the case for it. The case for it would be that all vehicles have wheels and most vehicles have 4 wheels so we can make that the default for a Vehicle. However, a tank could be a vehicle and doesn't necessarily have wheels; similarly with some farm equipment. 