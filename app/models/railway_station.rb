class RailwayStation < ApplicationRecord
<<<<<<< HEAD
  validates :title, presence: true

  has_many :trains
  has_many :tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

=======
>>>>>>> using scaffold for creating CRUD for railway_stations and trains
end
