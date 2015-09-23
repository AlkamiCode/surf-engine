class Zone < ActiveRecord::Base
  belongs_to :country
  has_many   :sub_zones
end
