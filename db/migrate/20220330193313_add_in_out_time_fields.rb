class AddInOutTimeFields < ActiveRecord::Migration[6.1]
  def change
    add_column :railway_stations_routes, :time_in, :time
    add_column :railway_stations_routes, :time_out, :time
  end
end
