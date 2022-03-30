class Route < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  before_validation :set_title

  private

  def set_title
    if railway_stations.size >= 2
      self.title = "#{railway_stations.ordered.first.title} - #{railway_stations.ordered.last.title}"
    end
  end
end
