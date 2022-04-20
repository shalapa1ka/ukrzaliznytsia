class TicketsController < ApplicationController
  before_action :find_ticket, only: :show
  before_action :find_train, only: :index

  def index
    @tickets = Ticket.where(train_id: @train.id)
  end

  def show; end

  def buy
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params)
    if @ticket.save!
      redirect_to train_tickets_path
    else
      render :buy
    end
  end

  private

  def tickets_params
    params.require(:ticket).permit(:train_id, :name)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end
