require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :bikes, :capacity


  def release_bike
    fail 'no bikes available' if empty?
    working_bikes = bikes.select {|bike| bike.working? == true}    
    fail 'no working bikes available' if working_bikes.empty?    
    released_bike = working_bikes.pop
    bikes.delete(released_bike)
  end

  def dock(bike)
    fail 'no docks available' if full?
    @bikes << bike
  end

  def broken_bike(bike)
    bike.report_broken 
    dock(bike)
  end

  def remove_for_repair
    repair_array = []
    repair_array = @bikes.select{ |bike| bike.broken }
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
