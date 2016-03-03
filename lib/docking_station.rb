require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :bike, :bikes, :capacity
  attr_writer :bike


  def release_bike
    fail 'no bikes available' if empty?
    fail 'bikes broken' if @bikes.last.broken
    @bikes.pop
  end

  def dock(bike)
    fail 'no docks available' if full?
    @bikes << bike
  end

  def broken_bike(bike)
    bike.broken = true
    dock(bike)
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
