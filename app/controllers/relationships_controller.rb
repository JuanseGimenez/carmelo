class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    if current_user.subscribe(@trip)
      flash[:success] = "¡Usted se subscribio con exito!"
      respond_to do |format|
        format.html { redirect_to @trip }
        format.js
      end
    else
      flash[:error] = "No es posible suscribirse a este evento"
    end
  end

  def destroy
    @trip = Relationship.find(params[:id]).trip
    if current_user.unsubscribe(@trip)
      flash[:success] = "¡Usted abandono este evento!"
      respond_to do |format|
        format.html { redirect_to @trip }
        format.js
      end
    else
      flash[:error] = "No es posible abandonar este evento en este momento"
    end
  end
end
