class Advertiser < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :company, :first_name, :last_name, :email, :address, :city, :postcode, :country
end