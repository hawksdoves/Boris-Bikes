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

      please_work = from.storage
      help(please_work)
      # from.storage.each do |bike| 
      # fail 'This van is now full' if from.storage.length == capacity 
      #   if bike.working? 
      #     van_storage << bike  
      #     from.storage.delete(bike) 
      #   end      
      # end
      
    else
      from.bikes.each {|bike| van_storage << bike if bike.working? == false }
      from.bikes.delete {|bike| bike.working? == false}
    end
  end


  def unload(to)
    van_storage.each {|bike| to << bike }
    van_storage.clear
  end

private
# please_work = from.storage
  def help(please_work)
    please_work.each do |bike| 
    fail 'This van is now full' if please_work.length == capacity 
        if bike.working? 
          van_storage << bike  
          please_work.delete(bike) 
        end  
    end
  end


end
