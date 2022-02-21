class AddRailwayStationIdToTrains < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :trains, :current_staion
  end
end
