require 'spec_helper'

describe Train do
  let(:train) { create :train }
  let(:carriage) { create :carriage }

  it 'should return seats count by carriage type' do
    count = 10
    expect(train_with_carriages(count: count).seats_by_type('CVCarriage', 'bottom_seats')).to eq(carriage.bottom_seats * count)
  end
end