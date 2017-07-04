class CarSegmentsController < ApplicationController
  before_action :trip_info, :only => [:new, :create, :edit, :update, :destroy, :show]

  def index
  end

  def new
    redirect_to new_car_path unless current_user.cars.any?
    @cars = current_user.cars
  end

  def create
    @cars = current_user.cars
    @segment = @trip.car_segments.build(car_segment_params)
    @segment.car = current_user.cars.find(params[:segment][:car_id])
    if @segment.save
      flash[:success] = "¡Su segmento fue registrado con exito!"
      redirect_to @trip
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end

  def edit
    @cars = current_user.cars
    @segment = @trip.car_segments.find(params[:id])
  end

  def update
    @cars = current_user.cars
    @segment = @trip.car_segments.find(params[:id])
    if @segment.update(car_segment_params)
      flash[:success] = "¡Su segmento fue editado con exito!"
      redirect_to @trip
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'edit'
    end
  end

  def show
    @segment = @trip.car_segments.find(params[:id])
  end

  def destroy
    @segment = @trip.car_segments.find(params[:id])
    if @segment.destroy
      flash[:success] = "Su segmento fue borrado con exito!"
      redirect_to @trip
    else
      flash[:error] = "No se puedo dar de baja su segmento!"
      redirect_to @trip
    end
  end

  private

  def trip_info
    @trip = current_user.trips.find(params[:trip_id])
  end

  def car_segment_params
    params.require(:car_segment).permit(
    :name,
    :description,
    :origin,
    :destination,
    :start_date,
    :end_date)
  end
end
