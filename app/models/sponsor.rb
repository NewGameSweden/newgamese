class Sponsor < ActiveRecord::Base
  mount_uploader :logo, SponsorImageUploader
end
