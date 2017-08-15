class Author < ActiveRecord::Base

	validates :name, presence: true # all authors have a name
	validates :name, uniqueness: true # no two authors have the same name
	validates :phone_number, length: { is: 10 } # author phone numbers are exactly ten digits

end
