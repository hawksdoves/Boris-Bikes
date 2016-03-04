require_relative 'garage'
require_relative 'Docking_Station'

class Van

attr_reader :van_storage, :capacity
DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @van_storage = []
    @capacity = capacity
  end

  def loading(from)
    if from.class == Garage

      the_holding = from.storage
      storing_bikes(the_holding, true)

    else
      the_holding = from.bikes
      storing_bikes(the_holding, false)

    end
  end


  def unload(to)
    if to.class == Garage
      van_storage.each {|bike| to.storage << bike }
      van_storage.clear
    else
      van_storage.each { |bike| to.dock(bike) }
    end
  end

private

  def storing_bikes(the_holding, state)
    the_holding.each do |bike| 
    fail 'This van is now full' if van_storage.length == capacity   
        if bike.working? == state
           van_storage << bike  
        end  
    end
    the_holding.delete_if {|bike| bike.working? == state }
  end

end
