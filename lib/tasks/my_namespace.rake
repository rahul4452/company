require 'faker'


namespace :my_namespace do
  desc "Populate City and employee"
  task popdb: :environment do
  	5.times do


  		city = City.create(name: Faker::Address.city)
  		puts "Created City \"" + city.name  + "\""
  		10.times do
  			employee = city.employees.new
  			employee.name = Faker::Name.name
  			employee.manager_id = rand(1..49)
  			employee.save
  			puts "Created Employee Name \"" + employee.name  + "\""
  		end

  	end
  end


  desc "Populate Subordidate and Manager"
  task popmanagerdb: :environment do
  	
  	@employee = Employee.all

  	@employee.each do |user|
  		puts "Created Employees \"" + user.name  + "\""
  	end
  end

end
