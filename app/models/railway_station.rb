class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :tickets
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> {
    joins(:railway_stations_routes).
      order('railway_stations_routes.position').uniq
  }

  scope :without_already_added, -> (stations){
    where.not(id: stations)
  }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_time(route, time_in, time_out)
    station_route = station_route(route)
    station_route.update(time_in: time_in, time_out: time_out) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def time_in(route)
    station_route(route)&.time_in&.strftime('%H:%M')
  end

  def time_out(route)
    station_route(route)&.time_out&.strftime('%H:%M')
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
