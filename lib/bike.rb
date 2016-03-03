class Bike

  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    return false if @broken
    true
  end

  def report_broken
    @broken = true
  end

end
