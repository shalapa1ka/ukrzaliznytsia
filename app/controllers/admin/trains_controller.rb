class Admin::TrainsController < Admin::BaseController
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
      redirect_to [:admin, @train], notice: 'Train successfully created!'
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to admin_trains_path, notice: 'Train successfully updated!'
    else
      render :new
    end
  end

  def destroy
    redirect_to admin_trains_path, notice: 'Train successfully deleted!' if @train.destroy
  end

  private

  def find_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :railway_station_id, :reverse)
  end
end
