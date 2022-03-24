class TrainsController < ApplicationController
  before_action :find_train, only: %i[show edit update destroy]

  def index
    @trains = Train.all
  end

  def show; end

  def new
    @train = Train.new
  end

  def edit; end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to @train
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to @train
    else
      render :new
    end
  end

  def destroy
    redirect_to trains_path if @train.destroy
  end

  private

  def find_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :railway_station_id, :reverse)
  end
end
