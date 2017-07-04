class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :info_colums, :only => [:index, :new, :create, :update, :show, :edit]

  def index
    @cars = current_user.cars
  end

  def new
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      flash[:success] = "¡Su auto fue registrado con exito!"
      redirect_to @car
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end


  def show
    @car = current_user.cars.find(params[:id])
  end

  def edit
    @car = current_user.cars.find(params[:id])
  end

  def update
    @car = current_user.cars.find(params[:id])
    if @car.update(car_params)
      flash[:success] = "¡Su auto se editó con exito!"
      redirect_to @car
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end

  def destroy
    @car = current_user.cars.find(params[:id])
    if @car.destroy
      flash[:success] = "¡Su auto se dio de baja con exito!"
      redirect_to @car
    else
      flash[:error] = "Corrija los errores para continuar"
      render 'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(
    :name,
    :year,
    :model,
    :places)
  end

  def info_colums
    @trips = current_user.trips + current_user.subscribing
    @last_users = User.last(5)
  end

end
