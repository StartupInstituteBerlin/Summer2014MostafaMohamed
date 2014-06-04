class ReservationsController < ApplicationController
 def new
    @reservation = Reservation.new
  end

  def create

   @restaurant= Restaurant.find(params[:reservation][:restaurant_id])
   @reservation = Reservation.new reservation_params

    if @reservation.save
        redirect_to @restaurant
    else
      render action: 'restaurants/show'
    end
  end
  private

  def reservation_params
    #params.require(:restaurant).permit(:name, :description, :phone, :address, :photo)
    params.require(:reservation).permit(:email, :date, :message, :restaurant_id)
  end

end
