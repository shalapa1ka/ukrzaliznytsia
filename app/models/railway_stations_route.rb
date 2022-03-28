class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :route
  belongs_to :railway_station

  validates :station_index, uniqueness: { scope: :route_id }
end
