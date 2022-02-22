class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route, class_name: 'Route', foreign_key: :route_id
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  has_many :tickets
end
