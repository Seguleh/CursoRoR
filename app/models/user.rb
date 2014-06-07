class User < ActiveRecord::Base
	has_one :profile
	has_many :comments

	def self.order_lastname
		order('lastname ASC')
	end
end