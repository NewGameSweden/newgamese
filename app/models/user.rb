class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates_uniqueness_of :username
  validates :social_security_number, presence: true, length: {is: 10}
  validates :first_name, presence: true, length: {minimum: 2, maximum: 20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :street, presence: true
  validates :postal_code, presence: true, length: {is: 5}
  validates :postal_city, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
