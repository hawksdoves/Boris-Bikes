class Bike
 

  def initialize
     @broken = false
   end

  def working?
    @broken ?  false : true
  end

  private
   attr_accessor :broken
   
end