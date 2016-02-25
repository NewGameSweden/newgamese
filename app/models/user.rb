class User < ActiveRecord::Base
	include Gravtastic
	gravtastic
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :tickets
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :username, presence: true, uniqueness: true
	validates :first_name, :surname, :email,  :address, :postal_address, :presence => true, :allow_blank => false
	validates :social_security_number, :phone_number, :postal_code, :presence => true, :allow_blank => false, :numericality => { only_integer: true }
	validates :sex, presence: true, allow_blank: false
end
