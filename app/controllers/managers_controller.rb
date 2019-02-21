class ManagersController < ApplicationController
	def index
		@sub = Employee.all
		@man = Employee.where("manager_id=id").paginate(:page => params[:page],:per_page => 10)
		@c = City.all
	end
end
