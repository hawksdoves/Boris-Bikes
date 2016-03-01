require 'Docking_Station.rb'

describe DockingStation do

	new_docking_station = DockingStation.new

	it 'responds to the command to release the bike' do

		expect(new_docking_station).to respond_to(:release_bike)
	end

	it 'can release a bike' do
		expect(new_docking_station.release_bike.class).to eq Bike
	end

	it 'releases a working bike' do
		expect(new_docking_station.release_bike.working?).to eq true	
	end
end
