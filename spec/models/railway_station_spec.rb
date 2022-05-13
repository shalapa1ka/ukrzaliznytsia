require 'spec_helper'

describe RailwayStation do
  let(:railway_station) { create :railway_station }
  let(:route) { create :route }
  let(:rwr) { create :railway_stations_route }
  describe 'taking data' do
    it 'position in route' do
      expect(railway_station.position_in(route)).to eq 1
    end
    it 'arriving time on station' do
      railway_station.time_in(route).to eq Time.new(1, 1, 1, 6, 0)
    end
    it 'departure time on station' do
      railway_station.time_in(route).to eq Time.new(1, 1, 1, 8, 0)
    end
  end

  describe 'updating data' do
    it 'position field'
    it 'time fields'
  end
end