class Bike

  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    return false if @broken
    true
  end


end
