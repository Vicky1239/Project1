class EmployeesController < ApplicationController
	def index
		@emp=Employee.all
		@city=City.all
	end

	def new 
		@emp=Employee.new
		@man=Employee.where("manager_id=id")
	end
	def create
		@emp=Employee.new(employ_params)
		if @emp.save
			redirect_to employees_path
		else
			render 'new'
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

	def show
		@manager = Employee.find(params[:id])
		@c2 = City.where(id: @manager.city_id)
		@subo = Employee.where(manager_id: @manager.id)
		@c = City.all
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
		params.require(:employee).permit(:name, :manager_id, :city_id, :willing_to_relocate)
end
end