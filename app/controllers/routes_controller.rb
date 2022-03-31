class RoutesController < ApplicationController
  before_action :find_route, only: %i[show edit update destroy add_railway_station remove_railway_station]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit; end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    redirect_to routes_url if @route.destroy
  end

  def add_railway_station
    station_route = RailwayStationsRoute.new(route_id: @route.id, railway_station_id: params[:railway_station_id],
                                             position: params[:position])
    @route.save if station_route.save
    render :show
  end

  def remove_railway_station
    station_route = RailwayStationsRoute.where(route_id: @route.id, railway_station_id: params[:station_id]).first
    if station_route.destroy
      @route.save
    end
    render :show
  end

  private

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end