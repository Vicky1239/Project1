class ManagersController < ApplicationController
	def index
		@man = Employee.where(manager_id: nil).paginate(:page => params[:page],:per_page => 10)
	end
	def show
		
	end
end
