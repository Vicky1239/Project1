class EmployeesController < ApplicationController
	def index
		@emp=Employee.all
	end
	def show
		@emp = Employee.find(params[:id])
	end

	def new 
		@emp=Employee.new
		@count=0
		@cities=City.all
	end
	def create
		@city=City.find(employ_params[:city_id].to_i)
		@emp=Employee.new(employ_params)
		if @city.employees.count<5 && @emp.save
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
		@cities=City.all
		if @emp.manager_id == nil
			@man=Employee.where(id: @emp.id)
		else
			@man=Employee.where(manager_id: nil)
		end

	end


	def update
		@emp=Employee.find(params[:id])
		if @emp.update_attributes(employ_params)
			if employ_params[:promote].to_i ==1
				@emp.update_attribute(:manager_id, nil)
			end
			redirect_to relocation_requests_employees_path
		else
			render 'edit'
		end
	end
 
	def relocation_requests
		@emp=Employee.where(willing_to_relocate: true)
	end
	def employ_params
		params.require(:employee).permit(:name, :manager_id, :city_id, :willing_to_relocate, :image, :promote)
end
end