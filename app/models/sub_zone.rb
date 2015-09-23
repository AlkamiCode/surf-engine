class SubZone < ActiveRecord::Base
  belongs_to :zone
  has_many   :spots
end
