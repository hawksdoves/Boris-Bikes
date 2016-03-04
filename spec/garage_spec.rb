require 'garage'

describe Garage do

  it 'calls fix bike method' do
    bike = Bike.new
    bike.report_broken
    subject.storage << bike
    subject.fixed
    expect(subject.storage[0].working?).to eq true
  end

  it 'can store bikes' do
    bike = Bike.new
    garage = Garage.new
    garage.storage << bike
    expect(garage.storage.length).to eq 1
  end

end
