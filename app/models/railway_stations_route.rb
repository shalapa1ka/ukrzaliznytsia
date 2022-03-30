class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :route
  belongs_to :railway_station

  validates :position, uniqueness: { scope: :route_id }, presence: true
end
