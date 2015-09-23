class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string  :name
      t.string  :wave_quality
      t.string  :experience_level
      t.string  :frequency
      t.string  :break_type
      t.string  :direction
      t.string  :sea_floor
      t.string  :power
      t.string  :usual_length
      t.string  :epic_length
      t.string  :ideal_swell_direction
      t.string  :ideal_wind_direction
      t.string  :swell_size
      t.string  :ideal_tide
      t.string  :ideal_tide_movement
      t.string  :weekday_crowd
      t.string  :weekend_crowd
      t.string  :dangers
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :sub_zone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
