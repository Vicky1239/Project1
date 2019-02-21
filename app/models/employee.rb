class Employee < ApplicationRecord
	
	validates :manager_id, presence: true
	validates :city_id, presence: true
	validate :custom_validation, :on => :create
	# validate :custom1_validation, :on => :update
	belongs_to :city
	private

	def custom_validation
	  	if willing_to_relocate.present?
	    	errors.add("New", "Trainee not allowed for willing_to_relocate")
	    end
	end
	# def custom1_validation
	# 	if (Employee.where("manager_id=id")).where.(id: id).any?
	# 	    errors.add("Manger_id", "Id can not be changed as employee itself is a manager")
	# 	end
	# end
end


