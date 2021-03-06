class Book < ActiveRecord::Base
	
	def self.order_title
		order('title ASC')
	end

	has_many :comments
	has_and_belongs_to_many :users

	def read_by_user?(user)
		users.include?(user)
	end

end
