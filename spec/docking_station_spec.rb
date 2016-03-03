  require 'docking_station'


describe DockingStation do

  it {is_expected.to respond_to :dock}
  # it {is_expected.to respond_to :bike}

  it 'expects instance of bike class' do
    subject = DockingStation.new
    expect(subject.create_bike).to be_a Bike
  end

  it 'returns a true if the bike is working' do
    bike = subject.create_bike
  expect(bike.working?).to be true
  end

  it 'dock the bike' do
  expect(subject.dock.length).to eq 1 
  end

  it 'returns a TypeError when #dock is empty' do
    expect { subject.release_bike }.to raise_error{ |error| error.should be_a (TypeError) }
  end

  it 'returns a TypeError when #dock is full with default capacity of bikes' do
      bikes = DockingStation::DEFAULT_CAPACITY + 1
  	expect { (bikes).times {subject.dock} }.to raise_error{ |error| error.should be_a (TypeError) }
  end

  it 'can asign a new maximum capacity from 20 to 10' do
  	expect(subject.capacity = 10).to eq 10
  end

  it "will release a bike" do
    subject.dock
    expect(subject.release_bike.class).to eq Bike
  end

  it "will break the bike" do
  	subject.create_bike.broken = false
  	expect(subject.create_bike.broken).to eq false
  end

  it "won't release a broken bike" do
    subject.dock
    subject.bikes[-1].broken = true
    expect(subject.release_bike).to eq "I am sorry, but this bike is broken, so it will not be released."
  end
end
