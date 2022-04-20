class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :route
  belongs_to :railway_station

  validates :position, uniqueness: { scope: :route_id }, presence: true

  after_commit :set_route_title

  private

  def set_route_title
    titles = route.railway_stations.ordered.pluck(:title)
    if titles.size >= 2
      route.update(title: "#{titles.first} - #{titles.last}")
    else
      route.update(title: 'Not specified')
    end
  end
end
