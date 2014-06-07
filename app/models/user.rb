class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy #nullify
	has_many :comments

	accepts_nested_attributes_for :profile

	def self.order_lastname
		order('lastname ASC')
	end

	def complete_name
		[name, lastname].join(" ")
	end
end