class Route < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  scope :include_station, -> (station, position = 0) {
    joins(:railway_stations)
      .where("railway_stations.id = #{station.id}")
      .where("position > #{position}")
      .pluck(:id)
  }

  def self.check_position(routes, from, to)
    res = []
    routes.each do |route|
      from_pos = RailwayStation.find(from.id).position_in(route)
      to_pos = RailwayStation.find(to.id).position_in(route)
      if from_pos < to_pos
        res << route
      end
    end
    res
  end

  def self.search_routes(from, to)
    result = Route.find(include_station(from) & include_station(to))
    check_position(result, from, to)
  end
end
