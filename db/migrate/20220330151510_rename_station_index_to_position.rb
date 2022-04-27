class RenameStationIndexToPosition < ActiveRecord::Migration[6.1]
  def change
    rename_column :railway_stations_routes, :station_index, :position
  end
end
