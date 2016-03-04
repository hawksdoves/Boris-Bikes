require_relative 'garage'
require_relative 'Docking_Station'

class Van

attr_reader :van_storage

  def initialize
    @van_storage = []
  end

  def loading(from)
    from.each { |bike| van_storage << bike }
    from.clear
  end
end