class Advertiser < ActiveRecord::Base
	belongs_to :user
	has_many :campaigns

	validates_presence_of :company, :first_name, :last_name, :email, :address, :city, :postcode, :country
end