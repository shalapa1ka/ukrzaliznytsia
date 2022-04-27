class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :find_ticket, only: [:show, :destroy]
  before_action :find_route, :find_from_station, :find_to_station, only: :new

  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = Ticket.where(user: current_user)
    end
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(tickets_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    redirect_to tickets_path, notice: 'Ticket successfully deleted!' if @ticket.destroy
  end

  private

  def tickets_params
    params.require(:ticket).permit(:train_id)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def find_route
    @route = Route.find(params[:route_id])
  end

  def find_from_station
    @from_station = RailwayStation.find params[:from]
  end

  def find_to_station
    @to_station = RailwayStation.find params[:to]
  end
end
