class EmployeeValidator < ActiveModel::EachValidator
  def validate(record)
  	byebug
    if !Employee.where(id: record.id).exists? 
    	emp = Employee.where(id: record.id)
    	if(emp.willing == true)
            errors.add(:willing, 'New joinee does not have the option for relocation')
        end
     end
  end
end