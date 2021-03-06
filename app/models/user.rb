class User < ActiveRecord::Base
	before_save {
		self.email = email.downcase
		self.first = first.capitalize
		self.last = last.capitalize
	}

	validates :email, presence: true, uniqueness: true
	validates_format_of :email, :with => /@/
	validates :first, presence: true
	validates :last, presence: true

	has_many :todos, dependent: :destroy
	
	has_secure_password
end
