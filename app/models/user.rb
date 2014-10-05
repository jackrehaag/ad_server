class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  USER_ROLES = ['Administrator', 'User']
	validates_presence_of :first_name, :last_name, :role
	validates :role, inclusion: USER_ROLES

	has_many :advertisers, dependent: :destroy
	has_many :campaigns, through: :advertisers
end