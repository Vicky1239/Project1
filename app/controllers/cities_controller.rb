class CitiesController < ApplicationController
	def index
		@cities=City.all.paginate(:page => params[:page],:per_page => 10)
	end
	def edit
	end

	def new
		@city=City.new
	end

	def create
		@city=City.new(city_params)
		if @city.save
			redirect_to cities_path
		else
			render 'new'
		end
	end

	def update
	end

	def delete
	end

	def show
		@c=City.find(params[:id])
		
	end
	def city_params
		params.require(:city).permit(:name)
	end
end
