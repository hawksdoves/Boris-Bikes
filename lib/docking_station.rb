require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :bike, :capacity
  DEFAULT_CAPACITY = 20


  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def create_bike
  	Bike.new
  end

  def dock
     raise TypeError, "This docking station is full." if full?
     
	   @bikes << create_bike

    end

  def release_bike
    raise TypeError, "No more bikes." if empty?
    if bikes[-1].broken == false
      @bikes.pop
    else
      "I am sorry, but this bike is broken, so it will not be released."
    end
  end

  private

  def full?
    bikes.size == DEFAULT_CAPACITY 
  end

  def empty?
    bikes.size == 0 
  end
end

