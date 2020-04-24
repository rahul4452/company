namespace :relocation_request do
  desc "Populate employee who want to relocate"
  task relocate: :environment do
  	
  	10.times do
  		employee = Employee.find(rand(1..49))
  		employee.willing_to_relocate = true
  		employee.save

  		puts "Created Employee Name #{employee.name} and #{employee.willing_to_relocate}"
  	end

  end

end
