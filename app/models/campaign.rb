class Campaign < ActiveRecord::Base
	belongs_to :advertiser
	monetize :budget_cents

	validates_presence_of :name, :budget, :start_date, :end_date, :in_pause, :link, :country, :creative, :advertiser_id, 
end