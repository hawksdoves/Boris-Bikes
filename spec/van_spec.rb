require 'van'

describe Van do 

	it 'can hold a bike' do
		subject.van_storage << Bike.new
		expect(subject.van_storage.length).to eq 1
	end

	it 'loads all bikes from garage to van' do 
		garage = Garage.new
		garage.storage << Bike.new
		subject.loading(garage.storage)
		expect(garage.storage).to eq []
		expect(subject.van_storage.length).to eq 1
	end
end