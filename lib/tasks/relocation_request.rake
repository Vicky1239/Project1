namespace :relocation_request do
  desc "TODO"
  task set_willing_to_relocate: :environment do 
  	9.times do 
		@emp=Employee.find(Faker::Number.between(43, 62))
		@emp.willing_to_relocate = true
		@emp.save
	end
  end

end
