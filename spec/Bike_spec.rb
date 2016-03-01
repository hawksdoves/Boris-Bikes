require 'Bike.rb'

describe Bike do

	new_bike = Bike.new

	it 'does work, the bike' do

		expect(new_bike).to respond_to(:working?)
	end	
end