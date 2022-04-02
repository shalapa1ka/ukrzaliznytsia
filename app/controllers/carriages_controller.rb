class CarriagesController < ApplicationController
  before_action :find_train, only: [:create, :new]
  before_action :find_carriage, only: [:show]

  def show; end

  def new
    @carriage = @train.carriages.build
  end

  def create
    @carriage = @train.carriages.build(carriage_params)
    if @carriage.save
      redirect_to @train, notice: 'Carriage successfully created!'
    else
      render :new
    end
  end

  private

  def carriage_params
    params.require(:carriage).permit(:top_seats, :type, :bottom_seats, :side_top_seats, :side_bottom_seats, :seating, :train_id)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def find_carriage
    @carriage = Carriage.find(params[:id])
  end
end
