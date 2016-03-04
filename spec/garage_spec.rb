require 'garage'

describe Garage do

let(:bike) {Bike.new}
let(:garage) {Garage.new}

  it 'calls fix bike method' do
    bike.report_broken
    subject.storage << bike
    subject.fixed
    expect(subject.storage[0].working?).to eq true
  end

  it 'can store bikes' do
    garage.storage << bike
    expect(garage.storage.length).to eq 1
  end


end
