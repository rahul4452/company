

class Employee < ApplicationRecord
	
	
  	belongs_to :city
  	has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
                          
  	belongs_to :manager, class_name: "Employee", optional: true

	validates :name, presence: true,length: { minimum: 3 }

  	
  	# validate :vali÷d_my_date_variable

  	  mount_uploader :image, ImageUploader


  	validate :validate_relocate, on: :create

	def validate_relocate
	#puts self.willing_to_relocate
	#post_exists = Post.where(author: 'tom').where(subject: 'Rails is awesome').exists?
	  if self.willing_to_relocate == true
	    self.errors.add(:willing_to_relocate, "New joinee does not have the option for relocation")
	    return false
	  end
	  true
	end
  
end
