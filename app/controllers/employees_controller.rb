class EmployeesController < ApplicationController
	def index
		@emp=Employee.all
		@city=City.all
		@man=Employee.where("manager_id=id")
	end
	def show
		@emp = Employee.find(params[:id])
		@c2 = City.where(id: @emp.city_id)
		@subo = Employee.where(manager_id: @emp.id)
		@c = City.all
	end

	def new 
		@emp=Employee.new
		@count=0
		@man=Employee.where("manager_id=id")
	end
	def create
		@a=employ_params[:city_id].to_i
		@count=Employee.where(city_id: @a).count
		@city_name=City.select(:name).where(id: @a)	
		@emp=Employee.new(employ_params)
		byebug
		if @count<3 && @emp.save
			redirect_to employees_path
		else
			render 'new'
		end
	end
	def ajax
		@k=params[:keyword]
		@test=Employee.select(:city_id).group(:city_id).having("count(*) > 2").all
		respond_to do |format|
			format.js
		end

	end
	
	def edit
		@emp=Employee.find(params[:id])
		if @emp.id == @emp.manager_id 
			@man=Employee.where(id: @emp.id)
		else
			@man=Employee.where("manager_id=id")
		end

	end


	def update
		@emp=Employee.find(params[:id])
		if @emp.update_attributes(employ_params)
			redirect_to relocation_requests_employees_path
		else
			render 'edit'
		end
	end

	def relocation_requests
		@emp=Employee.where(willing_to_relocate: true)
		@c = City.all
	end
	def employ_params
		params.require(:employee).permit(:name, :manager_id, :city_id, :willing_to_relocate, :image)
end
end