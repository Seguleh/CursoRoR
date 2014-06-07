class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy #nulify
	has_many :comments

	accepts_nested_attributes_for :profile

	def self.order_lastname
		order('lastname ASC')
	end
end