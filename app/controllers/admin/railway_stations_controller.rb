class Admin::RailwayStationsController < Admin::BaseController
  before_action :find_railway_station, only: %i[show edit update destroy update_position update_time]
  before_action :find_route, only: %i[update_position update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show; end

  def new
    @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: 'Railway Station successfully created!'
    else
      render :new
    end

  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station]
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_railway_stations_url, notice: 'Railway Station successfully deleted!' if @railway_station.destroy
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_time
    @railway_station.update_time(@route, params[:time_in], params[:time_out])
    redirect_to @route
  end

  private

  def find_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def find_route
    @route = Route.find params[:route_id]
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
