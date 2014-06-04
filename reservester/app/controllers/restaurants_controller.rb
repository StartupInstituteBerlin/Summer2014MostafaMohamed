class RestaurantsController < ApplicationController
before_action :authenticate_user!, only: [:create, :edit, :update]

def index
    
    if current_user
       @restaurants = current_user.restaurants
     else
       @restaurants = Restaurant.all
    end
  end

  def show
    
    @restaurant = Restaurant.find params[:id]
    @reservation = Reservation.new(restaurant_id: @restaurant.id) 


  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params

    if @restaurant.save
        redirect_to @restaurant
    else
      render action: 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find params[:id]
  end

  def update
    @restaurant = Restaurant.find params[:id]

    if @restaurant.update restaurant_params
      redirect_to @restaurant
    else
      render action: 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    #params.require(:restaurant).permit(:name, :description, :phone, :address, :photo)
    params.require(:restaurant).permit(:name, :user_id, :photo, :address, :description)
  end
end
