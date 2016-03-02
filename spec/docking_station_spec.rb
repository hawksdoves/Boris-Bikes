  require 'docking_station'


describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to :dock?}

  it 'expects instance of bike class' do
    expect(subject.release_bike).to be_a Bike
  end
  it 'returns a true if the bike is working' do
    @bike = subject.release_bike
  expect(@bike.working?).to be true
  end

  it 'if a biked is docked expect true' do
  expect(subject.dock?).to be true
  end




end
