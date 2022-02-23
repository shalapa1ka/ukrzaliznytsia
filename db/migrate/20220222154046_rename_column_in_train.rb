class RenameColumnInTrain < ActiveRecord::Migration[6.1]
  def change
    rename_column :trains, :current_station_id, :railway_station_id
  end
end
