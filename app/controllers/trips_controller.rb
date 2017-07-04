class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :info_colums, :only => [:new, :create, :update, :edit, :search]

  def create
    @trip = current_user.trips.build(trip_params)
    @trip.owner = current_user
    if @trip.save
      flash[:success] = "¡Empieza a planear!"
      redirect_to @trip
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end

  def search
    @departure_segments = CarSegment.where(
      :start_date => params[:start_date],
      :origin => params[:from_city],
      :destination => params[:to_city]
      ).paginate(page: params[:page], per_page: 5)
    @return_segments = params[:end_date] ? CarSegment.where(
      :start_date => params[:end_date],
      :origin => params[:to_city],
      :destination => params[:from_city]
      ).paginate(page: params[:page], per_page: 5) : []
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = current_user.trips.find(params[:id])
  end

  def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Su evento se modifico con exito!"
      redirect_to @trip
    else
      flash[:error] = "Su evento no se pudo modificar!"
      render 'edit'
    end
  end


  def show
    @trip = Trip.includes(:posts).find_by(id: params[:id])
    @post = Post.new
  end

  def destroy
    @trip = current_user.trips.find(params[:id])
    if @trip.destroy
      flash[:success] = "Su evento se dio de baja con exito!"
      redirect_to root_path
    else
      flash[:error] = "Su evento no se pudo dar de baja!"
      redirect_to root_path
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :name)
  end

  def info_colums
    @trips = current_user.trips + current_user.subscribing
  end
end
