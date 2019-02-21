class CitiesController < ApplicationController
	def index
		@cities=City.all.paginate(:page => params[:page],:per_page => 10)
		@e=Employee.all
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
		@e=Employee.where(City_id: @c.id)
		@c_all = City.all
		@m = Employee.where("manager_id=id")
	end
	def city_params
		params.require(:city).permit(:name)
	end
end
