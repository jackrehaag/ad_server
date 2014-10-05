class Campaign < ActiveRecord::Base
	belongs_to :advertiser

	has_attached_file :creative, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :creative, :content_type => /\Aimage\/.*\Z/

  monetize :budget_cents

	validates_presence_of :name, :budget, :start_date, :end_date, :link, :country, :creative, :advertiser_id
	validates :in_pause, inclusion: { in: [true, false] }
end