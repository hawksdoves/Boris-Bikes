class Bike

  def initialize
    @works = true
  end

  def working?
    @works
    
  end

  def report_broken
    @works = false
  end

end
