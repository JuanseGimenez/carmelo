class HotelSegmentsController < ApplicationController
  before_action :trip_info, :only => [:new, :create, :edit, :update, :show, :destroy]

  def index
  end

  def new
  end

  def create
    @segment = @trip.hotel_segments.build(hotel_params)
    if @segment.save
      flash[:success] = "¡Su segmento fue registrado con exito!"
      redirect_to @trip
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end

  def edit
    @segment = @trip.hotel_segments.find(params[:id])
  end

  def update
    @segment = @trip.hotel_segments.find(params[:id])
    if @segment.update(hotel_params)
      flash[:success] = "¡Su segmento fue editado con exito!"
      redirect_to @trip
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'edit'
    end
  end

  def show
    @segment = @trip.hotel_segments.find(params[:id])
  end

  def destroy
    @segment = @trip.hotel_segments.find(params[:id])
    if @segment.destroy
      flash[:success] = "Su segmento fue dado de baja con exito!"
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

  def hotel_params
    params.require(:hotel_segment).permit(
    :name,
    :description,
    :direction,
    :start_date,
    :end_date)
  end
end
