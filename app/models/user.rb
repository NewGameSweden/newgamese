class User < ActiveRecord::Base
	include Gravtastic
	gravtastic
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :username, presence: true, uniqueness: true       
end
