class Campaign < ActiveRecord::Base
	belongs_to :advertiser

	has_attached_file :creative, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :creative, :content_type => /\Aimage\/.*\Z/

  monetize :budget_cents

	validates_presence_of :name, :budget, :start_date, :end_date, :link, :country, :creative, :advertiser_id
	validates :in_pause, inclusion: { in: [true, false] }

	validate :start_date_must_be_before_end_date
	validate :end_date_must_be_in_the_future, on: :create

	scope :unpaused, -> { where(in_pause: false) }
	scope :active, -> { unpaused.where("? BETWEEN start_date AND end_date", Date.today) }

	def active?
		if Date.today.between?(start_date, end_date) && in_pause === false
			true
		else
			false
		end
	end

	private
	def start_date_must_be_before_end_date
		if end_date < start_date
			errors.add(:start_date, "can't be after end date")
			errors.add(:end_date, "can't be before start date")
		end
	end

	def end_date_must_be_in_the_future
		if end_date < Date.today
			errors.add(:end_date, "can't be before today")
		end
	end
end