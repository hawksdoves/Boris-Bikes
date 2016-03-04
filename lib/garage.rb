require_relative 'bike'

class Garage

  attr_reader :storage

  def initialize
    @storage = []
  end

  def fixed
    storage.map! do |bike|
      bike.fix_bike
      bike
    end
  end


end
