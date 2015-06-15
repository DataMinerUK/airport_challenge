require_relative 'plane'

class Airport

  attr_accessor :capacity

  def initialize capacity=100
    @planes = []
    @capacity = capacity
  end

  def take_off plane
    fail 'Too stormy to take off' if stormy?
    fail 'The plane is not at the airport' unless planes.include?(plane)
    planes.delete(plane)
    plane.take_off
  end

  def landing plane
    fail 'Too stormy to land'     if stormy?
    fail 'Cannot land plane. Airport is full' if full?
    planes << plane
    plane.land
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

  def current_weather
    @weather_conditions = ['sunny','stormy']
    [rand(weather_conditions.length)]
  end

  def stormy?
    current_weather == 'stormy'
  end

  private

  attr_reader :planes

end

