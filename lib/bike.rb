class Bike

  def initialize
    @works = true
  end

  def report_broken
    @works = false
  end

  def fix_bike
    @works = true
  end

  def working?
    @works
  end


end
