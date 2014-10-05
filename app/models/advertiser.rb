class Advertiser < ActiveRecord::Base
	belongs_to :user
	has_many :campaigns, dependent: :destroy

	validates_presence_of :company, :first_name, :last_name, :email, :address, :city, :postcode, :country
	validates_format_of :email,:with => Devise.email_regexp
end