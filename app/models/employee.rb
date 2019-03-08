class Employee < ApplicationRecord
	
	attr_accessor :promote
	validates :manager_id, presence: true
	validates :city_id, presence: true
	validate :custom_validation, :on => :create
	# validate :custom1_validation, :on => :update
	has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
	belongs_to :manager, class_name: "Employee"
	belongs_to :city
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	private

	def custom_validation
	  	if willing_to_relocate.present?
	    	errors.add("New", "Trainee not allowed for willing_to_relocate")
	    end
	end
end


