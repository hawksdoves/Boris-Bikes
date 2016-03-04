require 'van'

describe Van do

	it 'can hold a bike' do
		subject.van_storage << Bike.new
		expect(subject.van_storage.length).to eq 1
	end

	it 'loads all bikes from garage to van' do
		garage = Garage.new
		garage.storage << Bike.new
		subject.loading(garage)
		expect(garage.storage).to eq []
		expect(subject.van_storage.length).to eq 1
	end

	it 'unloads all bikes from van to garage' do
		garage = Garage.new
		3.times {subject.van_storage << Bike.new}
		subject.unload(garage.storage)
		expect(garage.storage.length).to eq 3
		expect(subject.van_storage).to eq []
	end

end
