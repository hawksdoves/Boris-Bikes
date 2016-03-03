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
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end


  it { is_expected.to respond_to(:bike) }

  it 'returns docked bikes' do
    subject.dock(double(:bike))
    expect(subject.release_bike).to be_a(Bike)
  end

  it 'allows MOP to report bike broken' do
    station = DockingStation.new
    bike = double(:bike)
    station.broken_bike(bike)
    expect(bike.working?).to eq false
  end

  it 'does not release broken bike' do
    subject.broken_bike(double(:bike))
    expect {subject.release_bike}.to raise_error 'bikes broken'
  end

    it 'fails if no bikes' do
      expect { while true
         subject.release_bike
       end }.to raise_error "no bikes available"
    end


end
