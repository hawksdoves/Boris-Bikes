require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'fails if no bikes' do
    expect { subject.release_bike }.to raise_error "no bikes available"
  end

  describe '#dock' do
    it 'does not dock bike' do
     DockingStation::DEFAULT_CAPACITY.times {subject.dock(double(:bike))}
     expect { subject.dock(double(:bike)) }.to raise_error "no docks available"
    end
  end

  it 'it changes capacity' do
    station = DockingStation.new(40)
    expect(station.capacity).to eq 40
  end

  it 'docks bike' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end

  it 'releases working bike' do
    bike = double(:bike,broken: false)
    subject.dock(bike)
    expect(subject.release_bike).to be bike
  end


  it { is_expected.to respond_to(:bike) }

  # SAME TEST AS RELEASE WORKING BIKE?
  #  let(:bike) {double :bike }
  #it 'returns docked bikes' do
  #  allow(bike).to receive(:broken).and_return(true)
  #  subject.dock(bike)
  #  expect(subject.release_bike).to eq bike
  #end

  it 'allows MOP to report bike broken' do
    station = DockingStation.new
    bike = double(:bike)
    allow(bike).to receive(:broken).and_return(false)
    station.broken_bike(bike)
    expect(bike.broken).to eq true
  end

  it 'does not release broken bike' do
    bike = double(:bike)
    allow(bike).to receive(:broken).and_return(true)
    #subject.broken_bike(bike)
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error 'bikes broken'
  end

    it 'fails if no bikes' do
      expect { while true
         subject.release_bike
       end }.to raise_error "no bikes available"
    end


end
