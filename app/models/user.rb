class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy #nullify
	has_many :comments

	has_and_belongs_to_many :books

	accepts_nested_attributes_for :profile

	#Validations

	validates :lastname, :email, presence: true

	def self.order_lastname
		order('lastname ASC')
	end

	def complete_name
		[name, lastname].join(" ")
	end

	def self.authenticate(email, password)
		u = User.where(email: email).first

		if u.nil?
			return nil
		elsif u.password != password
			return nil
		else
			return u
		end
	end
end