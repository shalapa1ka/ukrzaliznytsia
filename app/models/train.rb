class Train < ApplicationRecord
  validates :number, presence: true
  validates :reverse, inclusion: { in: [true, false] }

  belongs_to :route, class_name: 'Route', foreign_key: :route_id
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  has_many :tickets
  has_many :carriages, dependent: :destroy

  def carriages_ordered
    self.carriages.order("number #{reverse ? 'DESC' : 'ASC'}")
  end

  def seats_by_type(carriage_type, seats_type)
    self.carriages.where(type: carriage_type).sum(seats_type)
  end
end
