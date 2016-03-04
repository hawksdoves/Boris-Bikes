require 'van'

describe Van do
let(:station) {DockingStation.new}
let(:garage) {Garage.new}
let(:bike) {Bike.new}
	it 'can hold a bike' do
		subject.van_storage << bike
		expect(subject.van_storage.length).to eq 1
	end

	it 'loads all bikes from garage to van' do
		garage.storage << bike
		subject.loading(garage)
		expect(garage.storage).to eq []
		expect(subject.van_storage.length).to eq 1
	end

	it 'unloads all bikes from van to garage' do
		3.times {subject.van_storage << bike}
		subject.unload(garage)
		expect(garage.storage.length).to eq 3
		expect(subject.van_storage).to eq []
	end

	it 'stops unloading working bikes from van as station full' do
		15.times {station.dock(bike)}
		10.times {subject.van_storage << bike}
		expect { subject.unload(station)}.to raise_error 'no docks available'

	end

	it 'stops loading bikes from station as van full' do 
		15.times {station.broken_bike(bike)}
		expect { subject.loading(station)}.to raise_error 'This van is now full'
	end

	it 'only takes broken bikes from the station' do
		2.times {station.dock(Bike.new)}
		7.times {station.broken_bike(bike)}
		subject.loading(station)
		expect(subject.van_storage.length).to eq 7
	end

end
