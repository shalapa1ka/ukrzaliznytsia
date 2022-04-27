class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def result
    @from_station = RailwayStation.find(params[:from_station_id])
    @to_station = RailwayStation.find(params[:to_station_id])
    if @from_station == @to_station
      redirect_to search_path, notice: "Selected same stations"
    end
    @routes = Route.search_routes(@from_station, @to_station)
  end
end
