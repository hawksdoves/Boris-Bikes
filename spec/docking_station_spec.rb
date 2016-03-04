require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike}
  let(:station) {DockingStation.new}
  it { is_expected.to respond_to :release_bike }

  it 'doe snot release bikes if no bikes available' do
    expect { subject.release_bike }.to raise_error "no bikes available"
  end

  describe '#dock' do
    it 'does not dock bike when at full capacity' do
     DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
     expect { subject.dock(bike) }.to raise_error "no docks available"
    end
  end

  it 'allows you to create station with a different capacity' do
    station = DockingStation.new(40)
    expect(station.capacity).to eq 40
  end

  it 'docks bike' do
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end

  it 'releases working bike' do
    allow(bike).to receive(:working?).and_return(true)
    station.dock(bike)
    expect(station.release_bike).to be bike
  end

  it 'allows user to report bike as broken' do
    allow(bike).to receive(:working?).and_return(false)
    expect(bike).to receive(:report_broken) #testing that report_broken is being called to bike when calling the broken bike method
    station.broken_bike(bike)
  end

  it 'does not release broken bike' do
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:report_broken).and_return(false)
    station.broken_bike(bike)
    expect {station.release_bike}.to raise_error 'no working bikes available'
  end

  it 'fails if no bikes' do
    expect { while true
       station.release_bike
     end }.to raise_error "no bikes available"
  end

  it "only releases working bikes" do 
    allow(bike).to receive(:report_broken).and_return(false)
    allow(bike).to receive(:working?).and_return(true)
    3.times {station.dock(bike)}
    allow(bike).to receive(:working?).and_return(false)
    3.times {station.broken_bike(bike)}
    allow(bike).to receive(:working?).and_return(true)
    expect(station.release_bike.working?).to eq bike.working? == true
  end
  
  describe '#remove_for_repair' do
    # before (:each)
    #   @station = DockingStation.new
    #   @repair = @station.remove_for_repair
    # end

    # it 'creates an array of broken bikes' do
    #   station = DockingStation.new
    #   station.broken_bike(Bike.new)
    #   repair = station.remove_for_repair
    #   expect(repair.length).to be(1)
    # end
  end



  end
