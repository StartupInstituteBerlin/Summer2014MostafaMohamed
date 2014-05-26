class RestaurantsController < ApplicationController
	

	def index
      @restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create!(post_params)
	end

	def post_params
    	params.require(:restaurant).permit(:name, :description)
	end

end
