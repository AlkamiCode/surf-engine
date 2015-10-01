class Spot < ActiveRecord::Base
  belongs_to :sub_zone

  def self.half_batch(half)
    spots_count      = Spot.where.not(latitude: nil).count
    half_spots_count = spots_count / 2

    half_spots_count += 1 if half == "first" && spots_count.odd?

    Spot.where.not(latitude: nil).send(half, half_spots_count)
  end
end
