class User < ActiveRecord::Base
  after_create :create_mailchimp_subs
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :first_name, :surname, :email,  :address, :postal_address, :sex,
    :presence => true, :allow_blank => false
  validates :social_security_number, :phone_number, :postal_code,
    :presence => true, :allow_blank => false,
    :numericality => { only_integer: true }

  validates_format_of :email, :with => Devise::email_regexp
  validate :validate_ssc



  def find_by_username(username)
    User.where(:username => username)
  end

  def validate_ssc
    ssc=social_security_number
    if ssc.to_s.length < 10 || ssc.to_s.length > 12 || ssc.to_s.length == 11
      errors.add(:social_security_number, "Should be 10 or 12 numbers")
    end

    sscString = ssc.to_s
    if sscString.length == 12
      ssc = sscString[2..sscString.length].to_i
      p "123123123123123"
      p "123123123123123"
      p "123123123123123"
      p ssc
      p "123123123123123"
      p "123123123123123"
      p "123123123123123"
    end
    p ssc
    ssc = social_security_number.to_s.split('').collect{ |n| n.to_i }
    last = ssc[ssc.length-1]
    for i in 0..(ssc.length-1)/2
      ssc[i*2] = ssc[i*2]*2
    end
    checksum = 0
    for i in 0..(ssc.length-1)
      ssc[i] = ssc[i].to_s.split('').collect{ |n| n.to_i }
      for j in 0..(ssc[i].length-1)
        checksum += ssc[i][j]
      end
    end

    newChecksum = checksum-last
    closestTen = (newChecksum.div(10)+1)*10
    lastDigit = closestTen - newChecksum

    p lastDigit
    if lastDigit != last || checksum%10 != 0
      errors.add(:social_security_number, "Social security number is invalid")
    end
  end

  def create_mailchimp_subs
    gibbon = Gibbon::Request.new()
    gibbon.lists("7d35e1f26f").members(Digest::MD5.hexdigest(self.email)).upsert(body: {email_address: self.email, status: "subscribed", merge_fields: {FNAME: self.first_name, LNAME: self.surname}})
  end
end
