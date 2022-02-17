class Train < ApplicationRecord
<<<<<<< HEAD
  validates :number, presence: true

  belongs_to :route, class_name: 'Route', foreign_key: :route_id
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  has_many :tickets
  has_many :carriages

  def all_top_seats(kind)
    count = 0
    carriages.where(kind: kind).each do |car|
      count += car.top_seats
    end
    count
  end

  def all_bottom_seats(kind)
    count = 0
    carriages.where(kind: kind).each do |car|
      count += car.bottom_seats
    end
    count
  end
=======
>>>>>>> using scaffold for creating CRUD for railway_stations and trains
end
