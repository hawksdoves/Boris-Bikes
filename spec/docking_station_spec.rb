require 'Docking_Station.rb'

describe DockingStation do 
		
	new_docking_station = DockingStation.new

	it 'responds to the command to release the bike' do
		
		expect(new_docking_station).to respond_to(:release_bike)
	end
end