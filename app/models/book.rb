class Book < ActiveRecord::Base
	
	def self.order_title
		order('title ASC')
	end

	has_many :comments
end
