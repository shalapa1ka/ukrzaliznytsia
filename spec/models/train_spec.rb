require 'spec_helper'

describe Train do
  it 'should return seats count by carriage type' do
    carriage_type = CVCarriage.name
    seats_type = 'bottom_seats'
    count = 10
    sum = 0
    train = train_with_carriages(count: count, carriage_type: carriage_type)
    train.carriages.each do |carriage|
      sum += carriage.bottom_seats
    end

    expect(train.seats_by_type(carriage_type, seats_type)).to eq sum
  end
end