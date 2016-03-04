require_relative 'garage'
require_relative 'Docking_Station'

class Van

attr_reader :van_storage

  def initialize
    @van_storage = []
  end



  def loading(from)
    if from.class == Garage
      from.storage.each { |bike| van_storage << bike if bike.working? }
      from.storage.clear
    else
      from.bikes.each {|bike| van_storage << bike if bike.working? == false }
      from.bikes.delete {|bike| bike.working? == false}
    end
  end


  def unload(to)
    van_storage.each {|bike| to << bike }
    van_storage.clear
  end

end
